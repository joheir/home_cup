class TaskTemplatesController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]

  def index
    @tasks = TaskTemplate.all
    @task = TaskTemplate.new
  end

  def show
  end

  def new
  end


  def edit
  end

  def create
    @task = TaskTemplate.new(task_params)
    @task.account = current_account

    respond_to do |format|
      if @task.save!
        format.html { redirect_to task_url(@task), notice: "Task was successfully created." }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to task_url(@task), notice: "Task was successfully updated." }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "Task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_task
      @task = TaskTemplate.find(params[:id])
    end

    def task_params
      params.require(:task_template).permit(:title, :description, :min_age, :weekday)
    end
end
