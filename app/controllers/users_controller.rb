class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :correct_user, only: [:edit, :update]
  def new
    @user = User.new
  end
  
  def create 
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    # @ratings = @user.ratings.paginate(page: params[:page])
    # ratings = @user.ratings
    # @ratings = @user.ratings.paginate(page: params[:page])
    @ratings = @user.ratings.paginate(page: params[:page])

    # byebug

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      # Work within a successful update
    else
      render 'edit'
    end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                  :password_confirmation)
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end
end
