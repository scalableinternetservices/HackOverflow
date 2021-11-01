class Item < ApplicationRecord
	validates :name, presence: true, length: {maximum: 100}, uniqueness: true
	validates :description, presence: true, length: {maximum: 250}
	validates :price, presence: true
end
