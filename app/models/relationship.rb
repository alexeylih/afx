class Relationship < ActiveRecord::Base
	belongs_to :obj, class_name: "User"
  	belongs_to :subj, class_name: "User"
  	validates :obj_id, presence: true
  	validates :subj_id, presence: true
end
