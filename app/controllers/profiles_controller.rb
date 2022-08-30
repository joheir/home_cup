class ProfilesController < ApplicationController
  def index
    @profiles = Profile.all
  end

  def show
  end

  def new
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
