class RateConference < ActiveRecord::Base
  belongs_to :conference
  belongs_to :attendee
  belongs_to :event
  attr_accessible :value
end
