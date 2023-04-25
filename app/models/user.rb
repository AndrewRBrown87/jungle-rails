class User < ApplicationRecord

  has_secure_password

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :password, length: { minimum: 8 }

  def authenticate_with_credentials(email, password)
    # user = User.find_by_email(email.strip.downcase)

    user = User.where("email ILIKE ?", email.strip).first
    
    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end

end
