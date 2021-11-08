class Rating < ApplicationRecord
	belongs_to :order
	validates :stars, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
	validates :comment, presence: true, length: { maximum: 250 }

	# Helper functions
	def blank_stars
		return 5 - self.stars
	end
end
