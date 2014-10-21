class UsersController < ApplicationController

  # authorize_resource

 def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_path, notice: "Signed up!"
    else
      render "new"
    end
  end
end