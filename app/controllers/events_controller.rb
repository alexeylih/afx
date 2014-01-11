class EventsController < ApplicationController
	def index
		@events = current_user.events.all
  		render json: @events
  	end 
end
