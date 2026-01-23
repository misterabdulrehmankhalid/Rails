class UserMailer < ApplicationMailer
  def reset_password(user)
    @user = user
    @url  = edit_password_reset_url(token: user.reset_password_token)
    mail(to: @user.email, subject: "Reset your password")
  end
end
