class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :lockable, :timeoutable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :login, :username, :email, :password, :password_confirmation, :remember_me
  belongs_to :role
  belongs_to :event
  attr_accessible :street, :street_number, :colony, :city, :country, :first_name, :last_name, :phone, :state, :zip, :confirmed_at, :role_id, :event_id
  attr_accessor :login, :fullname
  
  validates :username, :first_name, :last_name, :phone, :street, :street_number, :colony, :city, :state, :zip, :country, :presence => true
  validates :username, :email, :uniqueness => {:scope => :event_id}
  validates_length_of :email, :maximum => 120
  validates_length_of :first_name, :last_name, :maximum => 30
  validates :username, :length => { :within => 8..30 }, :allow_blank => true
  validates :password, :length => { :within => 8..30 },  :allow_blank => true
  validates_format_of :email, :with => /^\w+([\.-]?\w+)*@[a-zA-Z0-9]+([\.-]?[a-zA-Z0-9]+)*(\.[a-zA-Z]{2,3})+$/i, :allow_blank => true
  validates_format_of :username, :with => /^[\w\._]+$/i, :reject_blank => true, :message => "solo debe contener _ . letras o numeros.", :if => :username?
  validates_format_of :password, :with => /^[\w]+$/i, :reject_blank => true, :message => "solo debe contener letras y numeros.", :if => proc { |u| !u.password.blank? }

  
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    login = conditions.delete(:login)
    where(conditions).where(["lower(username) = :value", { :value => login.downcase }]).first
  end
  
  #protected

  # Attempt to find a user by it's email. If a record is found, send new
  # password instructions to it. If not user is found, returns a new user
  # with an email not found error.
  def self.send_reset_password_instructions(attributes={})
    recoverable = find_recoverable_or_initialize_with_errors(reset_password_keys, attributes, :not_found)
    recoverable.send_reset_password_instructions if recoverable.persisted?
    recoverable
  end 

  def self.find_recoverable_or_initialize_with_errors(required_attributes, attributes, error=:invalid)
    (case_insensitive_keys || []).each { |k| attributes[k].try(:downcase!) }

    attributes = attributes.slice(*required_attributes)
    attributes.delete_if { |key, value| value.blank? }

    if attributes.size == required_attributes.size
      if attributes.has_key?(:login)
        login = attributes.delete(:login)
        record = find_record(login)
      else  
        record = where(attributes).first
      end  
    end  

    unless record
      record = new

      required_attributes.each do |key|
        value = attributes[key]
        record.send("#{key}=", value)
        record.errors.add(key, value.present? ? error : :blank)
      end  
    end  
    record
  end

  def self.find_record(login)
    where(["username = :value", { :value => login }]).first
  end 

  public
  
  def fullname
    first_name.titlecase + " " + last_name.titlecase 
  end
  
  def name_username
    first_name.titlecase + " " + last_name.titlecase + " (" + username + ")"
  end 
  
  self.per_page = 15
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |model|
        csv << model.attributes.values_at(*column_names)
      end
    end
  end

end#EOF DO NOT DELETE THIS COMMENT