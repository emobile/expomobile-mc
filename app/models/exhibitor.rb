class Exhibitor < ActiveRecord::Base
  attr_accessible :name, :email, :contact, :job, :phone, :social_reason, :twitter, :web_page, :work_street, :work_street_number, :work_colony, :work_zip, :logo, :exposition_key, :stand_location, :stand_size, :event_id
  belongs_to :event
  has_many :attendee_expositions, :dependent => :destroy
  has_attached_file :logo,
    :styles => {:medium => "x300",
    :thumb => "x100",
    :mobile => "x60" },
    :default_url => "/assets/default.jpg"
  has_many :offerts, :dependent => :destroy
  before_save :name_to_upcase
  
  validates :name, :social_reason, :event_id, :presence => true
  #validates :phone, :email, :contact, :job, :presence => true
  validates :contact, :uniqueness => { :scope => :event_id }
  #validates :social_reason, :name, :uniqueness => { :scope => :event_id }
  
  private
  
  def name_to_upcase
    self.name.mb_chars.upcase! if !name.nil?
    self.social_reason.mb_chars.upcase! if !social_reason.nil?
  end
end