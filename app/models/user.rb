class User < ActiveRecord::Base
  has_many :comments
  has_many :resources, foreign_key: :creator_id

  validates_presence_of :first_name, :last_name, :email, :username, :password_digest

  has_secure_password


end

