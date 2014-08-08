class User < ActiveRecord::Base
  has_many :comments
  has_many :resources, foreign_key: :creator_id

  validates_presence_of :first_name, :last_name, :email, :username, :password_digest
  validates :email, uniqueness: :true, format: {with: /\A.+@.+\.+.+{2,4}\z/, message: "Invalid email format"}
  has_secure_password


end

