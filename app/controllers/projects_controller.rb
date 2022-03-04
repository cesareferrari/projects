class ProjectsController < ApplicationController
  before_action :require_signin

  def index
    @done_projects = current_user.projects.done
    @todo_projects = current_user.projects.todo
  end

  def show
    @project = current_user.projects.find(params[:id])
    @activities_done = @project.activities.done
    @activities_todo = @project.activities.todo
  end

  def new
    @project = current_user.projects.new()
  end

  def create
    @project = current_user.projects.new(project_params)

    if @project.save
      flash[:notice] = "Project created successfully."
      redirect_to projects_url
    else
      flash.now[:alert] = "Please fix the errors below."
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @project = current_user.projects.find(params[:id])
  end

  def update
    @project = current_user.projects.find(params[:id])

    if @project.update(project_params)
      flash[:notice] = "Project updated successfully."
      redirect_to project_url(@project)
    else
      flash.now[:alert] = "Please fix the errors below."
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :done, :content)
  end
end
