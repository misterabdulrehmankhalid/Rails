class PasswordResetsController < ApplicationController
  skip_before_action :not_loggedin

  def new
  end

  def create
    user = User.where(email: params[:email]).first

    if user
      user.generate_password_token!
      UserMailer.reset_password(user).deliver_now
    end

    redirect_to login_path, notice: "If that email exists, a reset link has been sent."
  end

  def edit
    @user = User.where(reset_password_token: params[:token]).first

    unless @user&.password_token_valid?
      redirect_to forgot_password_path, alert: "Invalid or expired reset link."
    end
  end

  def update
    @user = User.where(reset_password_token: params[:token]).first

    unless @user&.password_token_valid?
      redirect_to forgot_password_path, alert: "Reset link expired. Try again."
      return
    end

    if @user.reset_password!(params[:password], params[:password_confirmation])
      redirect_to login_path, notice: "Password reset successfully. Please log in."
    else
      render :edit, status: :unprocessable_entity
    end
  end
end
