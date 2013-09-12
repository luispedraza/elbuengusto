class Notification < ActiveRecord::Base
	belongs_to :user
	# Orden por defecto de los microposts
	default_scope -> { order('created_at DESC') }
	# Cada notificación debe estar asociada a un usuario
	validates :user_id, presence: true
	# Cada notificación no puede tener más de 100 caracteres
	validates :content, presence: true, length: {maximum: 100}
end
