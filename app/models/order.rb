class Order < ApplicationRecord
	belongs_to :item
	belongs_to :buyer
	has_one :rating
	validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }
end
