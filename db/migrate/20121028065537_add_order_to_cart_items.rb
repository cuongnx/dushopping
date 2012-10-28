class AddOrderToCartItems < ActiveRecord::Migration
  def change
    add_column :cart_items, :order_id, :integer, default: nil
  end
end
