
class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews
  
  validates :name, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :password, :length => {:within => 6..40}
  validates :password_confirmation, :length => {:within => 6..40}


end
