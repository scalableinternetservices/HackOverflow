module ItemsHelper
	def cache_key_for_item(it)
		return "item/#{it.id}"
	end

	def cache_key_for_item_list
		return "item_list/#{Item.maximum(:id)}"
	end

	def cache_key_for_seller_items(s)
		return "seller/items/#{s.id}/#{s.items.count}"
	end

	def cache_key_for_seller_item(it)
		return "seller/item/#{it.id}"
	end

	def cache_key_for_new_item
		return "item/new"
	end
end
