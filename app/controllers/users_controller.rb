class UsersController < ApplicationController
  def new
  end

  def index
    @user = User.find(params[:id])
    @ratings = @user.ratings.paginate(page: params[:page])  end
end
