class RelationshipsController < ApplicationController

	skip_before_filter :verify_authenticity_token

	def create 
		current_user.add_friend(User.find(params[:subj_id]))
      	head :ok
	end

	private 

	def relationship_params 
		params.require(:type).require(:obj_id).require(:subj_id)
	end 

end
