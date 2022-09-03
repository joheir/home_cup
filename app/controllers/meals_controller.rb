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
    @profile = Profile.find(params[:profile_id])
    @meal = Meal.find(params[:id])
    if @profile.voted_for? @meal
      @meal.unliked_by @profile
    else
      @meal.liked_by @profile
    end
    render 'like', formats: :js
  end

  private

  def set_profile
    @profile = Profile.find(params[:profile_id])
  end
end
