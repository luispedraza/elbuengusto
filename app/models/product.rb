class Product < ActiveRecord::Base
	# Presencia de nombre, descripción y precio
	validates :name, :description, :price, presence: true
	# Precio mínimo, para que no haya precios nulos
	validates :price, numericality: { greater_than_or_equal_to: 0.01 }
	# Unicidad del nombre del producto
	validates :name, uniqueness: true					
end
