class SystemNotification < Notification
	validates :message, presence: true
end