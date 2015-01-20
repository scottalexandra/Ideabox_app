class UsersController < ApplicationController
  before_action :authorized, only: [:show]

  def show
    # byebug
    @user = User.find(params[:id])
    authorize! :read, @user
  end
end
