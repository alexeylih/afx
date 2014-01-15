class Event < ActiveRecord::Base
	belongs_to :user
	belongs_to :subject, polymorphic: true
	validates :verb, presence: true

p	def to_s
		created_at.to_s + " " + user.username + " " + verb + " " + subject.to_s
	end 

	def as_json(options = { })
    	jsonEvent = super(options)
    	jsonEvent[:text] = to_s    	
    	jsonEvent
	end

end
