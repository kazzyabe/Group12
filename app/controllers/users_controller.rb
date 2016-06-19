class UsersController < ApplicationController
  before_action :require_admin, only: [:index]

  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    if session[:user_id] == @user.id
      session[:user_id] = nil
      redirect_to '/', notice: "successfully destroyed"
    else
      redirect_to :back, :notice => "successfully destroyed"
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
