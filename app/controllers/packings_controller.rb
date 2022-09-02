class PackingsController < ApplicationController
 before_action :set_profile
  def index
    @packings = Packing.all
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
     @packing.destroy

      respond_to do |format|
        format.html { redirect_to profiles_path, notice: "Packing was successfully destroyed." }
        format.json { head :no_content }
      end
  end

  private

  def packing_params
    params.require(:packing).permit(:name, :item1, :item2, :item3, :item4, :item5, :item6, :item7, :item8, :item9, :item10, :color)
  end

  def set_profile
    @profile = Profile.find(params[:profile_id])
  end
end
