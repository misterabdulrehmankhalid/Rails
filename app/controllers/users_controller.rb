class UsersController < ApplicationController
  before_action :yes_logged_in, only: [ :new, :create ]
  def new
    @my_user = User.new
  end

  def create
    @my_user = User.new(user_params) # encapsulation
    if @my_user.save
      session[:user_id] = @my_user.id.to_s
      redirect_to root_path, notice: "Account Created Successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
