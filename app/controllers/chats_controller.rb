class ChatsController < ApplicationController
  before_action :set_chat, only: %i[index new create]

  def index
    @profile = Profile.find(session[:current_profile_id])
    @chats = Chat.all
  end

  def new
    @chat = Chat.new
    @profile = Profile.find(params[:profile_id])
  end

  def create
    @profile = Profile.find(params[:profile_id])
    @chat = Chat.new(chat_params)
    @chat.receiver_chat_id = @profile.id
    @chat.sender_chat_id = session[:current_profile_id]
    @chat.save
    if @chat.save
      redirect_to profile_path(session[:current_profile_id]), notice: "Message sent!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @profile = Profile.find(params[:profile_id])
    @chat = Chat.find(params[:id])
    @chat.receiver_chat = @profile
    @chat.toggle!(:done)
    redirect_to profile_chats_path(@profile)
  end

  def destroy
    @profile = Profile.find(params[:profile_id])
    @chats = Chat.where(receiver_chat: @profile)
    @chats.destroy_all
    redirect_to profile_path(@profile)
  end

  def chat_params
    params.require(:chat).permit(:message)
  end

  def set_chat
    @chats = Chat.where(receiver_chat: @profile)
  end
end
