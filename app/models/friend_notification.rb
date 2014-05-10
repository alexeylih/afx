class FriendNotification < Notification
	belongs_to :friend, :class_name => 'User', :foreign_key => 'subject_id'
	validates_presence_of :friend

	def as_json(options={})
		super(:include => 
			{ :friend => { :methods => :pic }})
	end
end