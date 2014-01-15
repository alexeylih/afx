class Relationship < ActiveRecord::Base
	  validates :type, presence: true
	  belongs_to :obj, class_name: "User"
    belongs_to :subj, class_name: "User"
    validates_presence_of :obj
  	validates_presence_of :subj
  	validates :obj_id, presence: true
  	validates :subj_id, presence: true
  	validate :cant_have_self_relationship 
  	validate :no_duplicates

  	def cant_have_self_relationship
    	errors.add(:obj_id, "can't have #{type.downcase} relationship with himself") if obj_id == subj_id
  	end	

  	def no_duplicates
    	if self.class.exists?(['(obj_id = ? and subj_id = ?) OR ((subj_id = ? and obj_id = ?))', obj_id, subj_id, obj_id, subj_id]) 
    		errors.add(:obj_id, "Relationship already exists")	
    	end 	
  	end	

end


