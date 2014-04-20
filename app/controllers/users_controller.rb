class UsersController < ApplicationController
	def index 
		render json: User.all 
	end 

	def friends 
		render json: current_user.friends
	end
end
