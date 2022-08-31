class TaskTemplatesController < ApplicationController
  before_action :set_task_template, only: %i[ show edit update destroy ]

  def index
    @task_templates = TaskTemplate.all
    @task_template = TaskTemplate.new
  end

  def show
  end

  def new
  end


  def edit
  end

  def create
    @task_template = TaskTemplate.new(task_template_params)
    @task_template.account = current_account

    respond_to do |format|
      if @task.save
        format.html { redirect_to task_templates_path, notice: "Task was successfully created." }
        format.json { render :show, status: :created, location: task_templates_path}
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task_template.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @task_template.update(task_template_params)
        format.html { redirect_to task_templates_path, notice: "Task was successfully updated." }
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
      format.html { redirect_to task_templates_url, notice: "Task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_task_template
      @task_template = TaskTemplate.find(params[:id])
    end

    def task_template_params
      params.require(:task_template).permit(:title, :description, :min_age, :weekday)
    end
end
