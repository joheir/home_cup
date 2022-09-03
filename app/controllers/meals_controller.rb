class MealsController < ApplicationController
  before_action :set_profile

  def index
    @meals = Meal.all
  end

  def destroy
    @meal = Meal.find(params[:id])
    @meal.destroy
  end

  def vote
    @meals = Meal.all
    @meals.each do |meal|
      if 
      current_votes = meal.votes
      new_vote = current_votes + 1
      meal.votes = new_vote
  end

  private

  def set_profile
    @profile = Profile.find(params[:profile_id])
  end
end
