class AddToFrontToProducts < ActiveRecord::Migration
  def change
    add_column :products, :to_front, :boolean, default: false
  end
end
