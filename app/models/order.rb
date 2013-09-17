class Order < ActiveRecord::Base
	has_many :cart_items, dependent: :destroy
	validates :name, :address, :email, :phone, presence: true

	def add_cart_items(cart)
		cart.cart_items.each do |item|
			item.cart_id = nil
			logger.debug item.id
			cart_items << item
			logger.debug item.order_id
		end
	end
end
