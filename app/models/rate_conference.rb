class RateConference < ActiveRecord::Base
  belongs_to :conference
  belongs_to :attendee
  belongs_to :event
  attr_accessible :value, :conference_id, :attendee_id, :event_id
end