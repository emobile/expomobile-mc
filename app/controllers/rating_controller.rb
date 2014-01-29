class RatingController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_event, :except => [:show_application_rating]
  
  def show_application_rating
    @ratings = Rating.all
    @total = Rating.count
    @poor_number = Rating.where(:value => 1).count
    @poor_percent = @poor_number * 100.0 / @total
    @fair_number = Rating.where(:value => 2).count
    @fair_percent = @fair_number *  100.0 / @total
    @good_number = Rating.where(:value => 3).count
    @good_percent = @good_number *  100.0 / @total
  end
  
  def show_workshops_rating
    if @event.has_workshop
      @ratings = RateWorkshop.where(:event_id => session[:current_event_id])
    else
      redirect_to root_path
    end
  end
  
  def show_conferences_rating
    if @event.has_conference
      @ratings = RateConference.where(:event_id => session[:current_event_id])
    else
      redirect_to root_path
    end
  end
  
  def load_event
    @event = Event.find_by_id(session[:current_event_id])
  end
end