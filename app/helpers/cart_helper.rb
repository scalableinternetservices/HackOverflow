module CartHelper

	def cache_key_for_cart(c)
		return "cart/#{c.id}"
	end

	def cache_key_for_buyer_cart(b)
		return "buyer/carts/#{b.id}/#{b.carts.count}"
	end
end
