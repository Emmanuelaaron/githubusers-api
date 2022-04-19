class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: true
  validates :password_digest, :username, presence: true
end
