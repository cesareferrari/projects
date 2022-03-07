class NextActivitiesController < ApplicationController
  before_action :set_activity

  def create
    @project.activities.each { |a| a.update(next: false) }
    @activity.update(next: true)
    redirect_to @project, notice: "Activity #{@activity.id} marked as next." 
  end

  private

  def set_activity
    @activity = Activity.find(params[:id])
    @project = @activity.project
  end
end
