class ChatsController < ApplicationController

  def index
  end

  def new
    @chat = Chat.new
    @profile = Profile.find(params[:profile_id])
  end

  def create
    @profile = Profile.find(params[:profile_id])
    @chat = Chat.new(chat_params)
    @chat.sender = @profile
    @chat.receiver = @profile

    if @appointment.save
      redirect_to user_path(current_user), notice: "Appointment was successfully booked."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def chat_params
    params.require(:chat).permit(:message)
  end
end
