class ProfilesController < ApplicationController
  def index
    @disable_log_out = true
    @disable_nav = true
    @profiles = Profile.where(account: current_account)
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def new
    @disable_log_out = true
    @disable_nav = true
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.account = current_account
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

  def profile_params
    params.require(:profile).permit(:name, :admin, :age, :picture)
  end
end
