class UsersController < ApplicationController
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
  
    @users = User.paginate(page: params[:page])

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

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                  :password_confirmation)
  end
end
