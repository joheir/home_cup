class ProfilesController < ApplicationController
  before_action :set_chat
  def index
    @disable_nav = true
    @disable_log_out = true
    @profiles = Profile.where(account: current_account)
  end

  def show
    @profile = Profile.find(params[:id])
    @meals = Meal.all
    session[:current_profile_id] = @profile.id
    @chats = Chat.all
  end

  def new
    @disable_log_out = true
    @disable_nav = true
    @disable_log_out = true
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.account = current_account
    if @profile.save
      redirect_to profiles_path
    else
      @disable_nav = true
      render :new
    end

  end

  def edit
  end

  def update
  end

  def destroy
  end

  def progresses
    @disable_nav = true
    @disable_log_out = true
    @profiles = current_account.profiles
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :admin, :age, :picture)
  end

  def set_chat
    @chats = Chat.where(receiver: @profile)
  end
end
