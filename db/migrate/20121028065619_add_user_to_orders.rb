class AddUserToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :user_id, :integer, default: nil
  end
end
