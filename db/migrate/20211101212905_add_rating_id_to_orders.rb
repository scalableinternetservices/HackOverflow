class AddRatingIdToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :rating_id, :integer
  end
end
