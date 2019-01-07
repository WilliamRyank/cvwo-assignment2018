class UsersController < ApplicationController

  def new
    if logged_in?
      redirect_to tasks_path
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    if params[:user][:confirm_password] == params[:user][:password]
      if @user.save
        session[:user_id] = @user.id
        flash[:success] = "Successfully creating new account"
        redirect_to tasks_path
      else
        render "new"
      end
    else
      flash[:danger] = "Your password does not match"
      render 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :password)
    end

end
