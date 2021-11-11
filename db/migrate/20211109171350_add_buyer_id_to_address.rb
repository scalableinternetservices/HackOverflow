class AddBuyerIdToAddress < ActiveRecord::Migration[6.1]
  def change
    add_column :addresses, :buyer_id, :integer
  end
end
