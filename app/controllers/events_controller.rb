class EventsController < ApplicationController
	def index
		@events = User.find(2).events.all
  		render json: @events
  	end 
end
