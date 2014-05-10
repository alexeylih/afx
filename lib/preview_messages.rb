class PreviewMessages 

	def initialize(messages, max_count)
		@messages = messages
		@max_count = max_count
	end

	def to_json 
		json_data = Hash.new
		json_data[:messages] = @messages.limit(@max_count)
		json_data[:total_count] = @messages.count
		json_data[:not_shown_count] = not_shown_count
		json_data[:not_read_count] = @messages.not_read.count
		json_data.to_json
	end

	private

	def not_shown_count
		[@messages.count - @max_count, 0].max
	end

end
