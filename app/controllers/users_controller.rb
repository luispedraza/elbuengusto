class UsersController < ApplicationController 
	def show
		@user = User.find(params[:id])
	end

	# Página de registro de un nuevo usuario
	def new
		@user = User.new
	end

	# Creación de un nuevo usuario
	def create
		@user = User.new(user_params)
		if @user.save
			# El usuario se ha guardado bien
			flash[:ok] = "Bienvenido. Te has registrado correctamente."
			redirect_to @user
		else 
			render 'new'
		end
	end

	def index
	end


	private
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end
end