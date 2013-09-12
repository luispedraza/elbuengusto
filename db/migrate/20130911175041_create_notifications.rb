class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
    add_index :notifications, [:user_id, :created_at]
  end
end
