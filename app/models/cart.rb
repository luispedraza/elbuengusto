class Cart < ActiveRecord::Base
	# Cada pedido tiene varios items, y si el carro se destruye estos son destruidos
	has_many :cart_items, dependent: :destroy

	# Función 'inteligente' para agregar nuevos productos al carrito
	def add_product (product_id)
		# Buscamos si el producto está ya en el carrito
		current_item = cart_items.find_by_product_id(product_id)
		if current_item
			current_item.quantity += 1 								# Incrementamos la cantidad
		else
			current_item = cart_items.build(product_id: product_id) # lo creamos
		end
		current_item												# devolvemos el producto del carrito
	end

	def total_price
		cart_items.to_a.sum {|item| item.total_price}
	end
end
