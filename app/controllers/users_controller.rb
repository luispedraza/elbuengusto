class UsersController < ApplicationController 
	before_action :signed_in_user, 	only: [:edit, :update]
	before_action :correct_user, 	only: [:edit, :update]
	before_action :admin_user, 		only: :destroy

	def show
		@user = User.find(params[:id])
		@notifications = @user.notifications
		@new_notification = current_user.notifications.build if signed_in?
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
			sign_in @user 	# Inicio de sesión tras el registro
			flash[:ok] = "Bienvenido. Te has registrado correctamente."
			redirect_to @user
		else 
			render 'new'
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			# éxito en la actualización
			flash[:success] = "El perfil se ha actualizado"
			sign_in @user
			redirect_to @user
		else
			render 'edit'
		end
	end

	def index
		# Muestra todos los usuarios
		@users = User.all
	end

	def destroy
		User.find(params[:id]).destroy
		flash[:success] = "Usuario destruido"
		redirect_to users_url
	end


	private
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
	end

	# Before filters
	def correct_user
		@user = User.find(params[:id])
		redirect_to(root_url) unless current_user?(@user)
	end

	def admin_user
		redirect_to(root_url) unless current_user.admin?
	end
end