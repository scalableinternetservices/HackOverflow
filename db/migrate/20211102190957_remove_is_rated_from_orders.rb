class RemoveIsRatedFromOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :is_rated, :boolean
  end
end
