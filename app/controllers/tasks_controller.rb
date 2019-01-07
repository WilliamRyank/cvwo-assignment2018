class TasksController < ApplicationController
  before_action :require_user

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = session[:user_id]
    if @task.save
      flash[:success] = "Successfully added new task"
      redirect_to tasks_path
    else
      render 'new'
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:success] = "Successfully edited new task"
      redirect_to task_path(@task)
    else
      render 'new'
    end
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      flash[:danger] = "Task was successfully destroyed"
      redirect_to tasks_path
    else
      render "tasks"
    end
  end

  private
    def task_params
      params.require(:task).permit(:task_name, :task_description, :task_due)
    end
end
