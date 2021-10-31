class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :quantity
      t.boolean :is_rated

      t.timestamps
    end
  end
end
