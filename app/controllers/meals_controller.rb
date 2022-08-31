class MealsController < ApplicationController
  def index
    @meals = Meal.all
  end

  def destroy
    @meal = Meal.find(params[:id])
    @meal.destroy
  end
end
