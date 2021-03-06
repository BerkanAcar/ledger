class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :set_user, only:[:show, :edit, :update, :destroy]
  def index
  	@users = User.all
  end

  def new
		@user = User.new
  end

  def create
  	@user = User.new(user_params)
    if	@user.save
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(users_params)
      redirect_to @current_user
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private
  def set_user
  	@user = User.find(params[:id])
  end

  def users_params
  	params.require(:user).permit(:email, :password, :name)
  end

  def logged_in_user
	  unless user_signed_in?
	    flash[:message] = "Please log in."
	    redirect_to new_user_session_path
	  end
  end
end
