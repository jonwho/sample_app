class User < ActiveRecord::Base
  before_save { email.downcase! } # a callback that happens during a life cyle of an ActiveRecord object
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password # requirement to use this method is bcrypt gem and password_digest column in the model
  validates :password, presence: true, length: { minimum: 6 }
end
