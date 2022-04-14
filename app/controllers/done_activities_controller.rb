class DoneActivitiesController < ApplicationController
  before_action :set_activity

  def create
    @activity.update(done: true, next: false)

    respond_to do |format|
      format.html { redirect_to @project, notice: "Activity marked as done." }
      format.turbo_stream
    end
  end

  def destroy
    @activity.update(done: false)
    redirect_to @project, notice: "Activity reactivated." 
  end

  private

  def set_activity
    @activity = Activity.find(params[:id])
    @project = @activity.project
  end
end
