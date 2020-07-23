class UsersController < ApplicationController
  def new
  end

  def index
  
    @users = User.paginate(page: params[:page])

  end

  def show
    @user = User.find(params[:id])
    # @ratings = @user.ratings.paginate(page: params[:page])
    @ratings = @user.ratings
  end
end
