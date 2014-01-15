class Notification < ActiveRecord::Base
	belongs_to :recipient, class_name: 'User'
	validates :recipient, presence: true
end


