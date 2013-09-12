class NotificationsController < ApplicationController
	before_action :signed_in_user

	def create
		@notification = current_user.notifications.build(notification_params)
		if @notification.save
			flash[:success] = "Notificación creada"
		end
		redirect_to current_user
	end

	def destroy
	end

	private
		def notification_params
			params.require(:notification).permit(:content)
		end
end
