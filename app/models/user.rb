require 'valid_email'
class User < ActiveRecord::Base
	has_many :reviews, dependent: :destroy
	before_save { self.email.downcase! }
	validates :name, presence: true, length: {minimum: 2}
	validates :email, presence: true, email: {mx: true}, uniqueness: true
	has_secure_password
	validates :password, presence: true, length: {minimum: 6}
end
