class ProjectsController < ApplicationController
  before_action :set_user
  before_action :require_signin

  def index
    @done_projects = @user.projects.done
    @todo_projects = @user.projects.todo
  end

  def show
    @project = @user.projects.find(params[:id])
    @actions = @project.actions
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

  def edit
    @project = @user.projects.find(params[:id])
  end

  def update
    @project = @user.projects.find(params[:id])

    if @project.update(project_params)
      flash[:notice] = "Project updated successfully."
      redirect_to user_project_url(@user, @project)
    else
      flash.now[:alert] = "Please fix the errors below."
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def project_params
    params.require(:project).permit(:name, :description, :done, :content)
  end
end
