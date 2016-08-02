class UsersController < ApplicationController

  def index
    @users = User.all
  end

def show
  @user = User.find(params[:id])

  if current_user.answers.nil? #! need to fix this
  @answer = Answer.new
else
  @answer = Answer.find(params[:id])
end


end

def edit
end

end
