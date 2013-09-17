class StoreController < ApplicationController
  def index
  	# Lista de productos ordenados por su nombre
  	@products = Product.order(:name)
  	# para que se pueda mostrar el carrito en el detalle
  	@cart = current_cart
  end
end
