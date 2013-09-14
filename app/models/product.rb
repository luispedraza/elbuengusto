class Product < ActiveRecord::Base
	# Relaciones con las imágenes de producto 
	has_many :product_images, :dependent => :destroy
	accepts_nested_attributes_for :product_images, reject_if: :reject_image
	# Relaciones con otras tablas
	has_many :cart_items
	# Antes de destruirlo comprobamos que no está referenciado por un elemento en pedido
	before_destroy :ensure_not_referenced_by_any_cart_item


	# Presencia de nombre, descripción y precio
	validates :name, :description, :price, presence: true
	# Precio mínimo, para que no haya precios nulos
	validates :price, numericality: { greater_than_or_equal_to: 0.01 }
	# Unicidad del nombre del producto
	validates :name, uniqueness: true					



	private
	# Función de ayuda para comprobar que no hay productos pendientes de pedido
	# antes de eliminarlos de la base de datos
	def ensure_not_referenced_by_any_cart_item
		if cart_items.empty?
			return true
		end
		errors.add(:base, "Existen elementos de este producto en pedidos pendientes")
		return false
	end

	def reject_image(attrib)
		attrib['caption'].blank? || attrib['photo'].nil?
	end
end
