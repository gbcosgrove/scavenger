class UserSessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Thanks for logging in!"
      redirect_to challenges_path
    else
      logger.info params.inspect
      logger.info(user.authenticate(params[:password]).to_s)
      flash[:error] = "There was a problem logging in. Please check your email and password."
      render action: 'new'
    end
  end
end