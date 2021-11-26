module RatingsHelper
	def cache_key_for_rating(rat)
		return "rating/#{rat.id}"
	end

	def cache_key_for_item_ratings(it)
		return "item/ratings/#{it.id}/#{params[:page]}/#{it.ratings.count}"
	end
end
