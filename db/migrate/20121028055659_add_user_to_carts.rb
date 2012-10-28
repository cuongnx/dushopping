class AddUserToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :user_id, :integer, default: nil
  end
end
