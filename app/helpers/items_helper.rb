module ItemsHelper
	def cache_key_for_item(it)
		return "item/#{it.id}"
	end

	def cache_key_for_item_list
		return "item_list/#{Item.maximum(:id)}"
	end
end
