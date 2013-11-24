class User < ActiveRecord::Base
  has_many :comments
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :nickname, presence: true, uniqueness: true
end
