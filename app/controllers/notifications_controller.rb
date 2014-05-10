class NotificationsController < ApplicationController
	def index 
		@notifications = current_user.notifications
		render json: PreviewMessages.new(@notifications, 2).to_json
	end	
end
