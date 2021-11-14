class AddSellerIdToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :seller_id, :string
  end
end
