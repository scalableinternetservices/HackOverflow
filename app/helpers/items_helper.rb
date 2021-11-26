module ItemsHelper

	def cache_key_for_item(item)
		user_id = buyer_signed_in? ? 1 : 0
		return "item/#{user_id}/#{item.id}"
	end

	def cache_key_for_item_list
		return "item_list/#{params[:page]}/#{Item.maximum(:id)}"
	end

	def cache_key_for_new_item
		return "item/new"
	end

	def cache_key_for_seller_item(it)
		return "seller/item/#{it.id}"
	end

	def cache_key_for_seller_items(s)
		return "seller/items/#{s.id}/#{params[:page]}/#{s.items.count}"
	end

end
