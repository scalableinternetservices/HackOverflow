module OrdersHelper
	def cache_key_for_order(o)
		return "order/#{o.id}"
	end

	def cache_key_for_buyer_orders(b)
		return "buyer/orders/#{b.id}/#{params[:page]}/#{b.orders.count}"
	end
end
