class User < ActiveRecord::Base

  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 8 }, confirmation: { case_sensitive: true }
  validates :password_confirmation, presence: true

  def authenticate_with_credentials(email, password)
    @user = User.find_by(email: email)

  end

end
