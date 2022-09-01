class PackingsController < ApplicationController
 before_action :set_profile
  def index
    @profile = Profile.find(params[:profile_id])
  end

  def show
  end

  def new
    @packing = Packing.new
  end

  def create
    @packing = Packing.new(packing_params)
    @packing.profile = @profile
    @profile.save
    redirect_to profiles_path
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def packing_params
    params.require(:packing).permit(:name, :item1, :item2, :item3, :item4, :item5, :item6, :item7, :item8, :item9, :item10, :color)
  end

  def set_profile
    @profile = Profile.find(params[:profile_id])
  end
end
