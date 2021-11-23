class Item < ApplicationRecord
	has_many :orders
	has_many :carts
	has_many :ratings, :through => :orders
	validates :name, presence: true, length: {maximum: 100}, uniqueness: true
	validates :description, presence: true, length: {maximum: 250}
	validates :price, presence: true

	belongs_to :seller
end
