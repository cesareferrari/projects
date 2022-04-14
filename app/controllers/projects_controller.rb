class ProjectsController < ApplicationController
  before_action :require_signin

  def index
    @projects = current_user.projects.todo
  end

  def show
    @project = current_user.projects.find(params[:id])
    @activities = @project.activities.todo
    @done_activities = @project.activities.done
    # @todos = @project.activities.todo
    # @next = @project.activities.next.first
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

  def destroy
    @project = current_user.projects.find(params[:id])
    @project.destroy
    redirect_to done_projects_url, notice: "Project removed."
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :done, :content, :priority, :cover, :category_id)
  end
end
