class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::SecurePassword
  field :email, type: String
  field :password_digest, type: String

  field :reset_password_token, type: String
  field :reset_password_sent_at, type: Time

  has_secure_password

  validates :email, presence: true, uniqueness: true

  def generate_password_token!
    update!(
      reset_password_token: SecureRandom.urlsafe_base64,
      reset_password_sent_at: Time.current
    )
  end

  def password_token_valid?
    reset_password_sent_at && reset_password_sent_at > 15.minutes.ago
  end

  def reset_password!(new_password, new_password_confirmation)
    update!(
      password: new_password,
      password_confirmation: new_password_confirmation,
      reset_password_token: nil,
      reset_password_sent_at: nil
    )
  end
end
