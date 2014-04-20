class MessagesController < ApplicationController

	skip_before_filter :verify_authenticity_token

	def send_message
		begin
			message = Message.new ({
				sender: current_user,
				reciever: User.find(params[:reciever_id]),
				message_text: params[:message_text]
			})

			message.save!
			render json: message
		rescue => e
			logger.debug e.to_s
      		render :json => { :errors => e.to_s }, :status => 500  
		end  
	end

	def recieved
		messages = current_user.recieved_messages.limit(5)
		render json: messages.to_json(:include => { :sender => { :methods => :pic } }) 
	end

end
