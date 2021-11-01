class Address < ApplicationRecord
	validates :street_address, presence: true, length: {maximum: 250}
	validates :city, presence: true, length: {maximum: 50}
	validates :state, presence: true, length: {maximum: 50}
	VALID_ZIPCODE_REGEX = /\A[0-9]{5}(?:-[0-9]{4})?\z/i
	validates :zipcode, presence: true, format: { with: VALID_EMAIL_REGEX }
end
