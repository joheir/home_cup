class MealsController < ApplicationController
  before_action :set_profile

  def index
    @meals = Meal.all
  end

  def destroy
    @meal = Meal.find(params[:id])
    @meal.destroy
  end

  private

  def set_profile
    @profile = Profile.find(params[:profile_id])
  end
end
