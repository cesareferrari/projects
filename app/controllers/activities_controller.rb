class ActivitiesController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @activity = @project.activities.new()
  end

  def create
    @project = Project.find(params[:project_id])
    @activity = @project.activities.new(activity_params)

    if @activity.save
      respond_to do |format|
        format.html {redirect_to @project, notice: "Activity created successfully."}
        format.turbo_stream
      end
    else
      flash.now[:alert] = "Please, correct errors below."
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @project = Project.find(params[:project_id])
    @activity = @project.activities.find(params[:id])
  end

  def update
    @project = Project.find(params[:project_id])
    @activity = @project.activities.find(params[:id])

    if @activity.update(activity_params)
      redirect_to @project, notice: "Activity updated successfully."
    else
      flash.now[:alert] = "Please, correct errors below."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @activity = @project.activities.find(params[:id])

    @activity.destroy
    redirect_to @project, notice: "Activity Removed."
  end

  private

  def activity_params
    params.require(:activity).permit(:content)
  end
end
