class RatingController < ApplicationController
  before_filter :authenticate_user!
  
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
    @ratings = RateWorkshop.all
    @total = RateWorkshop.count
    @poor_number = RateWorkshop.where(:value => 1).count
    @poor_percent = @poor_number * 100.0 / @total
    @fair_number = RateWorkshop.where(:value => 2).count
    @fair_percent = @fair_number *  100.0 / @total
    @good_number = RateWorkshop.where(:value => 3).count
    @good_percent = @good_number *  100.0 / @total
  end
end