class MealsController < ApplicationController
  def index
    @meals = Meal.all
    @profile = Profile.find(params[:profile_id])
  end

  def destroy
    @meal = Meal.find(params[:id])
    @meal.destroy
  end
end
