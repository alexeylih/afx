class RelationshipsController < ApplicationController

	skip_before_filter :verify_authenticity_token

	def create 
		relationship = Friendship.new ({obj_id: params[:obj_id], 
			 subj_id: params[:subj_id]})

		relationship.save!
	end


	private 

	def relationship_params 
		params.require(:type).require(:obj_id).require(:subj_id)
	end 

end
