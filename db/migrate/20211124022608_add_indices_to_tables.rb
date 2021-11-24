class AddIndicesToTables < ActiveRecord::Migration[6.1]
	def up
		add_index :carts, :buyer_id, unique: false
		add_index :carts, :item_id, unique: false

		add_index :items, :seller_id, unique: false

		add_index :orders, :buyer_id, unique: false
		add_index :orders, :item_id, unique: false
		add_index :orders, :rating_id, unique: false

		add_index :ratings, :order_id, unique: false
	end

	def down
		remove_index :carts, :buyer_id if index_exists?(:carts, :buyer_id)
		remove_index :carts, :item_id if index_exists?(:carts, :item_id)

		remove_index :items, :seller_id if index_exists?(:items, :seller_id)

		remove_index :orders, :buyer_id if index_exists?(:orders, :buyer_id)
		remove_index :orders, :item_id if index_exists?(:orders, :item_id)
		remove_index :orders, :rating_id if index_exists?(:orders, :rating_id)

		remove_index :ratings, :order_id if index_exists?(:ratings, :order_id)
	end
end
