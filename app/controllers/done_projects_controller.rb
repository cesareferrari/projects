class DoneProjectsController < ApplicationController
  def index
    @projects = current_user.projects.done
  end
end
