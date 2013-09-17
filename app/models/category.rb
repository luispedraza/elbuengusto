class Category < ActiveRecord::Base
	# Relación con los productos
	has_and_belongs_to_many :products
	# Foto adjunta
	has_attached_file :photo
end
