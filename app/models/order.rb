class Order < ApplicationRecord
	belongs_to :item
	validates :is_rated, inclusion: [true, false]
	validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }
end
