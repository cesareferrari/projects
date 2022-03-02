class ActivitiesController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @activity = @project.activities.new()
  end

  def create
    @project = Project.find(params[:project_id])
    @activity = @project.activities.new(activity_params)

    if @activity.save
      redirect_to @project, notice: "Activity created successfully."
    else
      flash.now[:alert] = "Please, correct errors below."
      render :new, status: :unprocessable_entity
    end
  end

  private

  def activity_params
    params.require(:activity).permit(:content)
  end
end
