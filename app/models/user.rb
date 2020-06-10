class User < ApplicationRecord

  # validate that email is present and unique
  validates :email, presence: true, uniqueness: true

  has_secure_password

  has_many :orders

end
