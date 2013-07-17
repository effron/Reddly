class User < ActiveRecord::Base
  attr_accessible :username, :password, :password_confirmation, :session_token
  has_secure_password

  has_many :links
  has_many :subs
  has_many :comments

  validates :username, presence: true
  validates :password, :password_confirmation, presence: true, on: :create
end
