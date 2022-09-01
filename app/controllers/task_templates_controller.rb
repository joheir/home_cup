 class TaskTemplatesController < ApplicationController
  before_action :set_task_template, only: %i[ show edit update destroy ]
  before_action :set_profile

  def index
    @task_templates = TaskTemplate.all
    @task_template = TaskTemplate.new
    @profile = Profile.find(params[:profile_id])
  end

  def show
  end

  def new
  end


  def edit
  end

  def create
    @selected = params[:weekdays]
    @weekdays = @selected["selected"]
    @weekdays.each do |weekday|
      if weekday.present?
        @task_template = TaskTemplate.new(task_template_params)
        @task_template.weekday = weekday
        @task_template.account = current_account
        @task_template.save!
      end
    end
    redirect_to profile_task_templates_path(@profile)
    # respond_to do |format|
    #   if @task_template.save
    #     format.html { redirect_to task_templates_path, notice: "Task was successfully created." }
    #     format.json { render :show, status: :created, location: task_templates_path}
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @task_template.errors, status: :unprocessable_entity }
    #   end
    # end
  end


  def update
    respond_to do |format|
      if @task_template.update(task_template_params)
        format.html { redirect_to profile_task_templates_path(@profile), notice: "Task was successfully updated." }
        format.json { render :show, status: :ok, location: @task_template }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task_template.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task_template.destroy

    respond_to do |format|
      format.html { redirect_to profile_task_templates_url(@profile), notice: "Task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_task_template
      @task_template = TaskTemplate.find(params[:id])
    end

    def task_template_params
      params.require(:task_template).permit(:title, :description, :min_age)
    end

    def set_profile
      @profile = Profile.find(params[:profile_id])
    end

end
