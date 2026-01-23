class SessionsController < ApplicationController
  before_action :yes_logged_in, only: [ :new, :create ]
  def new
  end

  def create
    my_user = User.where(email: params[:email]).first

    if my_user&.authenticate(params[:password])
      session[:user_id] = my_user.id.to_s
      redirect_to root_path, notice: "Logged in successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "Logged Out Successfully."
  end
end
