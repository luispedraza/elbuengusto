module SessionsHelper
	# Abrir sesión
	def sign_in(user)
		remember_token = User.new_remember_token
		cookies.permanent[:remember_token] = remember_token
		user.update_attribute(:remember_token, User.encrypt(remember_token))
		self.current_user = user
	end

	def signed_in?
		!current_user.nil?
	end

	def current_user=(user)
		@current_user = user
	end

	def current_user
		remember_token = User.encrypt(cookies[:remember_token])
    	@current_user ||= User.find_by(remember_token: remember_token)
	end

	def current_user?(user)
		user == current_user
	end

	def signed_in_user
		unless signed_in?
			store_location
			redirect_to entrar_url, notice: "Por favor, inicia sesión"
		end
	end

	# Cerrar sesión
	def sign_out
		self.current_user = nil
		cookies.delete(:remember_token)
	end


	# Friendly forwarding
	def redirect_back_or(default)
		redirect_to(session[:return_to] || default)
		session.delete(:return_to)	# se borra la variable de sesión
	end

	# Guarda en la sesión la url actual, para poder volver a ella
	def store_location
		session[:return_to] = request.url if request.get?
	end

	# Identificador del carro de la compra del usuario
	def current_cart
		# Buscamos el carro de la compra utilizando la variable de sessión 
		Cart.find(session[:cart_id])
		rescue ActiveRecord::RecordNotFound
			cart = Cart.create	# Creamos un nuevo carro de la compra
			session[:cart_id] = cart.id
			cart
		end
	end

end
