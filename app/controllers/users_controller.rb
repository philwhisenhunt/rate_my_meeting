class UsersController < ApplicationController
  def new
  end

  def index
    # render html: "Hello"
    # @user = User.find(params[:id])

  end

  def show
    @user = User.find(params[:id])
    # @ratings = @user.ratings.paginate(page: params[:page])
    @ratings = @user.ratings
  end
end
