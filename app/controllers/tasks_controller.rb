class TasksController < ApplicationController
  before_action :require_user
  before_action :set_task, only: [:show, :edit, :destroy, :update]

  def index
    @tasks = @current_user.tasks.all
    @categories = @current_user.categories.all.uniq{|cat| cat.name }
  end

  def new
    @task = Task.new
    @category = Category.new
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = session[:user_id]
    find_category
    # if block is when the category exist in database
    if @category != nil
      @task.category_id = @category.id
      save_task
    # else block if category does not exist in database, hence must create new category
    else
      create_category
      if @category.save
        @task.category_id = @category.id
        save_task
      else
        render 'new'
      end
    end
  end


  def show
  end

  def edit
  end

  def update
    find_category
    # if block is when the category exist in database
    if @category != nil
      @task.category_id = @category.id
      update_task
    # else block if category does not exist in database, hence must create new category
    else
      create_category
      if @category.save
        @task.category_id = @category.id
        update_task
      else
        render 'new'
      end
    end
  end

  def destroy
    if @task.destroy
      flash[:success] = "Task was successfully destroyed"
      redirect_to tasks_path
    else
      render 'tasks'
    end
  end


  private
    def task_params
      params.require(:task).permit(:task_name, :task_description, :task_due)
    end

    def set_task
      @task = Task.find(params[:id])
    end

    def update_task
      if @task.update(task_params)
        flash[:success] = "Successfully updated task"
        redirect_to tasks_path
      else
        render 'new'
      end
    end

    def save_task
      if @task.save
        flash[:success] = "Successfully added new task"
        redirect_to tasks_path
      else
        render 'new'
      end
    end

    def find_category
      @category = Category.find_by(name: params[:task][:category].capitalize)
    end

    def create_category
      @category = Category.new(name: params[:task][:category])
    end
end
