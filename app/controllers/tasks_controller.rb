class TasksController < ApplicationController
  before_action :require_user

  def index
    @tasks = Task.all
    @categories = Category.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = session[:user_id]
    category = Category.find_by(name: params[:task][:category])
    if category != nil
      @task.category_id = category.id
      if @task.save
        flash[:success] = "Successfully added new task"
        redirect_to tasks_path
      else
        render 'new'
      end
    else
      category = Category.new(name: params[:task][:category])
      if category.save
        @task.category_id = category.id
        if @task.save
          flash[:success] = "Successfully added new task"
          redirect_to tasks_path
        else
          render 'new'
        end
      else
        render 'new'
      end
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
      flash[:success] = "Task was successfully destroyed"
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
