class ProfileTasksController < ApplicationController
  before_action :set_profile, only: %i[index new edit update]

  def index
    @profile_tasks = ProfileTask.where(profile_id: params[:profile_id])
  end

  def new
  end

  def create_multiple
    @profiles = Profile.where(account: current_account)
    @profiles.each { |profile| profile.profile_tasks.destroy_all }

    @template_tasks = TaskTemplate.where(account: current_account)

    @template_tasks.each do |t_task|
      @p_task = ProfileTask.new
      @p_task.task_template_id = t_task.id
      profile = current_account.profiles.order(Arel.sql('random()')).first
      if profile.id <= t_task.min_age
        @p_task.profile = profile
        @p_task.save!
      end
    end

    the_profile_id = session[:current_profile_id] || current_account.profiles.first.id
    redirect_to(profile_profile_tasks_path(the_profile_id))
  end

  # def create
  #   @profile_task = ProfileTask.new
  #   @task = TaskTemplate.new(task_params)
  #   @task.account = current_account
  #   respond_to do |format|
  #     if @task.save!
  #       format.html { redirect_to task_url(@task), notice: "Task was successfully created." }
  #       format.json { render :show, status: :created, location: @task }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @task.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def edit
    @profile_task = ProfileTask.find(params[:id])
  end

  def update
    @profile_task = ProfileTask.find(params[:id])
    @profile_task.profile = @profile
    @profile_task.toggle!(:done)

    redirect_to profile_profile_task_path
  end

  private

  def profile_task_params
    params.require(:profile_task).permit(:title, :description, :min_age, :weekday)
  end

  def set_profile
    @profile = Profile.find(params[:profile_id])
  end
end
