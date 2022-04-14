class DoneActivitiesController < ApplicationController
  before_action :set_activity

  def create
    @activity.update(done: true, next: false)
    @project = @activity.project
    @activities = @project.activities.todo
    @done_activities = @project.activities.done

    respond_to do |format|
      format.html { redirect_to @project, notice: "Activity marked as done." }
      format.turbo_stream
    end
  end

  def destroy
    @activity.update(done: false)
    @project = @activity.project
    @activities = @project.activities.todo
    @done_activities = @project.activities.done

    respond_to do |format|
      format.html { redirect_to @project, notice: "Activity reactivated." }
      format.turbo_stream
    end
  end

  private

  def set_activity
    @activity = Activity.find(params[:id])
  end
end
