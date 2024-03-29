class User < ActiveRecord::Base
	before_save { |user| user.email = email.downcase }
	before_save :create_remember_token

	attr_accessible :email, :name, :password, :password_confirmation
	
	has_one :cart
	has_many :orders

	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false}
	validates :password, length: { minimum: 6 }
	validates :password_confirmation, presence: true
	has_secure_password

	private

	def create_remember_token
		self.remember_token = SecureRandom.urlsafe_base64
	end
end
