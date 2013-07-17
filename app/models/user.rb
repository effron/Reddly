class User < ActiveRecord::Base
  attr_accessible :username, :password, :password_confirmation, :session_token
  has_secure_password

  validates :username, presence: true
  validates :password, :password_confirmation, presence: true, on: :create
end
