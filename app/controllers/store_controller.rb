class StoreController < ApplicationController
  def index
  	# Lista de productos ordenados por su nombre
  	@products = Product.order(:name)
  end
end
