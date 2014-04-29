class MessagesController < ApplicationController
	before_action :set_message, only: [:destroy]
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
		messages = current_user.recieved_messages

		render json: messages.limit(5).to_json(:include => 
			{ :sender => { :methods => :pic }}) 
	end

	def destroy 
		begin
			if @message
				@message.destroy
			else
				render :json => { :errors => 'Message was not found' }, :status => 404
			end					
		rescue Exception => e
			render :json => { :errors => e.to_s }, :status => 500
		end
		head :ok
	end

	def mark_all_as_read 
		Message.where({reciever: current_user, read: [false, nil]}).update_all(read: true)
		head :ok
	end 

	private

	def set_message
		@message = Message.find(params[:id])
	end

end
