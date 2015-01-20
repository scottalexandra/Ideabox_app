class SessionsController < ApplicationController
  def new
    # @user = User.new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      redirect_to user_path(@user)
      flash[:notice] = "Successfully Logged In"
      session[:user_id] = @user.id
    else
      flash[:error] = "Invalid Login"
      render :new
    end
  end
end
