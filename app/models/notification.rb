class Notification < ActiveRecord::Base
	belongs_to :recipient, class_name: 'User'
	validates :recipient, presence: true

	scope :not_read, -> { where(read: [false, nil]) }



	def as_json(options={})
		super(options.merge({:methods => :type}))
	end

end


