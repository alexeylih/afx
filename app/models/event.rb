class Event < ActiveRecord::Base
	belongs_to :user
	belongs_to :subject, polymorphic: true
	validates :verb, presence: true

	def to_s
		case verb
		when "add_friend"
			"#{created_at.to_s}: #{user.username} added new friend #{subject.username}"
		else
			raise RuntimeError
		end
	end 

	def as_json(options = {})
    	jsonEvent = super(options)
    	jsonEvent[:text] = to_s    	
    	jsonEvent
	end

end
