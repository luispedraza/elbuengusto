class AddOrderIdToCartItem < ActiveRecord::Migration
  def change
    add_column :cart_items, :oder_id, :integer
  end
end
