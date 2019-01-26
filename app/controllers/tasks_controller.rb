class TasksController < ApplicationController
  before_action :require_user
  before_action :set_task, only: [:show, :edit, :destroy, :update]
  before_action :get_users_and_categories, only: [:index, :indexdate]
  before_action :get_months, only: [:indexdate]

  def index
    @task = Task.new
  end

  def indexdate
    @task = Task.new
  end

  def new
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = session[:user_id]
    find_category
    if @category != nil
      @task.category_id = @category.id
      if @task.save
        flash[:success] = "Successfully added new task"
        redirect_to tasks_path
      else
        flash[:danger] = "Error adding new task. Please ensure you have input the task name(max. 25 characters) and category"
        redirect_to tasks_path
      end
    # else block if category does not exist in database, hence must create new category
    else
      create_category
      if @category.save
        @task.category_id = @category.id
        if @task.save
          flash[:success] = "Successfully added new task"
          redirect_to tasks_path
        else
          flash[:danger] = "Error adding new task. Please ensure you have input the task name(max. 25 characters) and category"
          redirect_to tasks_path
        end
      else
        flash[:danger] = "Error adding new task. Please ensure category name is present."
        redirect_to tasks_path
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
        flash[:danger] = "Error updating task. Please ensure category name is present"
        redirect_to tasks_path
      end
    end
  end

  def destroy
    @task.destroy
    respond_to  do |format|
      format.html { redirect_to tasks_path, notice: "Task was successfully destroyed" }
      format.json { head :no_content}
      format.js { flash.now[:success] = "Task was successfully destroyed" }
    end
  end


  private
    def task_params
      params.require(:task).permit(:task_name, :task_description, :task_due, :category_name)
    end

    def set_task
      @task = Task.find(params[:id])
    end

    def update_task
      if @task.update(task_params)
        flash[:success] = "Successfully updated task"
        redirect_to tasks_path
      else
        flash[:danger] = "Error updating task. Please ensure you have input the task name(max. 25 characters) and category"
        redirect_to tasks_path
      end
    end

    def save_task
      if @task.save
        flash[:success] = "Successfully added new task"
        redirect_to tasks_path
      else
        flash[:danger] = "Error adding new task. Please ensure you have input the task name(max. 25 characters) and category"
        redirect_to tasks_path
      end
    end

    def find_category
      @category = Category.find_by(name: params[:task][:category].capitalize)
    end

    def create_category
      @category = Category.new(name: params[:task][:category])
    end

    def get_users_and_categories
      @tasks = @current_user.tasks.all.order("task_due")
      @categories = @current_user.categories.all.order("name").uniq{|cat| cat.name }
    end

    def get_months
      @months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    end
end
