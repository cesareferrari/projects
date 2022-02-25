class ProjectsController < ApplicationController
  before_action :require_signin

  def index
    @user = User.find(params[:user_id])
    @projects = @user.projects
  end

  def show
    @user = User.find(params[:user_id])
    @project = @user.projects.find(params[:id])
  end
end
