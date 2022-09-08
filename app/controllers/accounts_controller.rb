class AccountsController < ApplicationController
  skip_before_action :authenticate_account!, only: :index
  # before_action :set_chat
  def index
    @disable_nav = true
  end

  # def set_chat
  #   @chats = Chat.where(receiver_chat: @profile)
  # end

end
