class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, 
         :omniauthable

  has_and_belongs_to_many :feeds
  has_many :reading_articles
  has_many :articles, through: :reading_articles
  has_many :events
  has_many :relationships_as_obj, :class_name => 'Relationship',  :foreign_key => 'obj_id'
  has_many :relationships_as_subj, :class_name => 'Relationship', :foreign_key => 'subj_id'

  def relationships
    relationships_as_obj + relationships_as_subj
  end

 #attr_accessible :email, :password, :password_confirmation, :remember_me, :username
  
  validates_presence_of :username
  validates_uniqueness_of :username

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.username = auth.info.nickname
    end
  end
  
  def self.new_with_session(params, session)
  	logger.debug "self.new_with_session"
    if session["devise.user_attributes"]
    	logger.debug session["devise.user_attributes"]
      new session["devise.user_attributes"] do |user|
      	logger.debug "new session"
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end
  
  def password_required?
    super && provider.blank?
  end
  def email_required?
  	super && provider.blank?
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end  



end
