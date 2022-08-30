class ProfilesController < ApplicationController
  def index
    @disable_log_out = true
    @disable_nav = true
    @profiles = Profile.all
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
    @profile = Profile.new(params[:profile])
    @profile.save
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
