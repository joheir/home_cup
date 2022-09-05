class ProfilesController < ApplicationController

  def index
    @disable_nav = true
    @disable_log_out = true
    @profiles = Profile.where(account: current_account)
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def new
    @disable_nav = true
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
    @profiles = Profile.all
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :admin, :age, :picture)
  end
end
