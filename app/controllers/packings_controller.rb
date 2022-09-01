class PackingsController < ApplicationController
  def index
    @profile = Profile.find(params[:profile_id])
  end

  def show
  end

  def new
    @packing = Packing.new
    @profile = Profile.find(params[:profile_id])
  end

  def create
    @packing = Packing.new(packing_params)
    @profile = Profile.find(params[:profile_id])
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
end
