class DescriptionsController < ApplicationController
  before_action :require_signin
  before_action :set_project

  def create
    respond_to do |format|
      format.turbo_stream
    end
  end

  def destroy
    respond_to do |format|
      format.turbo_stream
    end
  end

  private

  def set_project
    @project = current_user.projects.find(params[:project_id])
  end
end
