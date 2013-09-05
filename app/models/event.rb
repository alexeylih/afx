class Event < ActiveRecord::Base
	belongs_to :user
	belongs_to :subject, polymorphic: true

	def to_s
		created_at.to_s + " " + user.name + " " + verb + " " + subject.title
	end 

  	
	def as_json(options = { })
    	jsonEvent = super(options)
    	jsonEvent[:text] = to_s    	
    	jsonEvent
	end



end
