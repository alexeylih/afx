class Message < ActiveRecord::Base
	belongs_to :sender, class_name: "User"
	belongs_to :reciever, class_name: "User"

	validates_presence_of :sender, :message => "was not found"
	validates_presence_of :reciever, :message => "was not found"
	validates_presence_of :message_text

	scope :not_read, -> { where(read: [false, nil]) }

	def serializable_hash(options = nil)
      	result = super(options)
      	result[:not_read_count] = Message.not_read.count
      	result
	end
end
