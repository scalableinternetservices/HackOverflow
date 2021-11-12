class AddBuyerIdToOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :buyer_id, :integer
  end
end
