class User < ActiveRecord::Base
  has_many :comments
  has_many :resources
  validates_presence_of :first_name, :last_name, :email, :username, :password_digest

  has_secure_password


end

