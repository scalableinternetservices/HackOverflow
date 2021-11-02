class AddOrderIdToRatings < ActiveRecord::Migration[6.1]
  def change
    add_column :ratings, :order_id, :integer
  end
end
