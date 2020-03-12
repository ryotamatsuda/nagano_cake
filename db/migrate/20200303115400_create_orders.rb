class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :end_user_id, null: false
      t.integer :total_price, null: false
      t.integer :order_status, null: false, default: 0
      t.integer :method_of_payment, null: false
      t.string :shopping_post_code, null: false
      t.string :shopping_street_address, null: false
      t.string :shopping_name, null: false
      t.timestamps
    end
  end
end
