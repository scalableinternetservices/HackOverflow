class AddBuyerIdToCart < ActiveRecord::Migration[6.1]
  def change
    add_column :carts, :buyer_id, :integer
  end
end
