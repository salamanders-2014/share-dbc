class User < ActiveRecord::Base
  has_many :comments
  has_many :resources, foreign_key: :creator_id
  has_many :votes

  validates_presence_of :first_name, :cohort, :last_name, :email, :username, :password_digest
  validates :email, uniqueness: { case_sensitive: false }, format: {with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i, message: "Invalid email format"}
  validates :password, length: { minimum: 5 }
  has_secure_password


end

