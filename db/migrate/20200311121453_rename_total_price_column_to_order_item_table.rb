class RenameTotalPriceColumnToOrderItemTable < ActiveRecord::Migration[5.2]
  def change
    rename_column :order_items, :total_price, :subtotal_price
  end
end
