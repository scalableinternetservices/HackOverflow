class Buyer < ApplicationRecord
	before_save { self.email.downcase! }
	validates :firstname, presence: true, length: {maximum: 32}
	validates :lastname, presence: true, length: {maximum: 32}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
end
