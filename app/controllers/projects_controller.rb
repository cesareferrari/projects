class ProjectsController < ApplicationController
  before_action :set_user
  before_action :require_signin

  def index
    @projects = @user.projects
  end

  def show
    @project = @user.projects.find(params[:id])
  end

  def new
    @project = @user.projects.new()
  end

  def create
    @project = @user.projects.new(project_params)

    if @project.save
      flash[:notice] = "Project created successfully."
      redirect_to user_projects_url(@user)
    else
      flash.now[:alert] = "Please fix the errors below."
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def project_params
    params.require(:project).permit(:name, :description)
  end
end
