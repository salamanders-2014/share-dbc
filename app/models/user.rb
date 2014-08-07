class User < ActiveRecord::Base
  has_many :comments
  has_many :resources
  has_many :votes
  validates_presence_of :first_name, :last_name, :email, :username, :role, :password_digest

  has_secure_password
end
