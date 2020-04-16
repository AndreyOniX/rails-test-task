class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true, length: { minimum: 2, maximum: 100 }
  validates :login, presence: true, uniqueness: true, username: true
end
