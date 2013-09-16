class ProductImage < ActiveRecord::Base
	belongs_to :product
	has_attached_file :photo, :styles => { :small => "150x150>", :large => "350×350>", :icon => "32x32>" }
	validates_attachment_presence :photo
	validates_attachment_size :photo, :less_than => 5.megabytes
	validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
end
