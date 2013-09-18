class User < ActiveRecord::Base
	# Avatar de usuario
	has_attached_file :avatar, :styles => {small: "50x50#", medium: "150x150#"}, :processors => [:cropper]
	# Atributos para recortar la imagen de avatar:
	attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
	after_update :reprocess_avatar, :if => :cropping?

	# Cada usuario tiene muchas notificaciones, que son destruidas con el usuario 
	has_many :notifications, dependent: :destroy

	before_save {
		self.email = email.downcase
	}
	before_create :create_remember_token

	validates :name, 	presence: true, 
	length: {maximum: 50}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, 	presence: true, 
	format: { with: VALID_EMAIL_REGEX },  
	uniqueness: true
	has_secure_password
	validates :password, length: {minimum: 6}

	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	def cropping?
		!crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
	end

	def reprocess_avatar
		avatar.reprocess!
	end

	private
		def create_remember_token
			self.remember_token = User.encrypt(User.new_remember_token)
		end

end
