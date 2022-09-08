class PackingsController < ApplicationController
 before_action :set_profile
 before_action :set_chat, only: %i[index new]


  def index
    @packings = @profile.packings
  end

  def show
  end

  def new
    @packing = Packing.new
  end

  def create
    @packing = Packing.new(packing_params)
    @packing.profile = @profile
    @packing.save
    redirect_to profile_packings_path(@profile)
  end

  def edit
  end

  def update
  end

  def destroy
    @packing = Packing.find(params[:id])
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

  def set_chat
    @chats = Chat.where(receiver_chat: @profile)
  end
end
