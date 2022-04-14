class NextActivitiesController < ApplicationController
  before_action :set_activity

  def create
    @project.activities.each { |a| a.update(next: false) }
    @activity.update(next: true)
    @activities = @project.activities.todo

    respond_to do |format|
      format.html { redirect_to @project, notice: "Activity marked as next." }
      format.turbo_stream
    end
  end

  private

  def set_activity
    @activity = Activity.find(params[:id])
    @project = @activity.project
  end
end
