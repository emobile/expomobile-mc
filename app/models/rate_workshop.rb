class RateWorkshop < ActiveRecord::Base
  belongs_to :workshop
  belongs_to :attendee
  belongs_to :event
  attr_accessible :value, :workshop_id, :attendee_id, :event_id
end