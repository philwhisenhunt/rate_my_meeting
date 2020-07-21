class SessionsController < ApplicationController
  def new
  end

  def create 
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      reset session 
      log_in user
      redirect_to user
    else
      #show me an error
      flash.now[:danger] = "Not the right combo of email and password"
      render 'new'
    end
  end

  def destroy
  end

  def review
    render 'review'
  end

end
