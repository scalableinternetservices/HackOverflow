module RatingsHelper
	def cache_key_for_rating(rat)
		return "rating/#{rat.id}"
	end
end
