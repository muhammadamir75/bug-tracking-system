class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_projects = @user.projects
  end

  def index
    @users = User.all
  end

  def destroy

  end
end