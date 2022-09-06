class ChatsController < ApplicationController

  def index
    @profile = Profile.find(params[:profile_id])
    @chats = Chat.all
  end

  def new
    @chat = Chat.new
    @profile = Profile.find(params[:profile_id])
  end

  def create
    @profile = Profile.find(params[:profile_id])
    @chat = Chat.new(chat_params)
    @chat.sender_id = @profile.id
    @chat.save
    if @chat.save
      redirect_to profile_path(@profile), notice: "Message sent!."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def chat_params
    params.require(:chat).permit(:message, :receiver_id)
  end
end
