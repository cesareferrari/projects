class UsersController < ApplicationController
  before_action :require_signin

  def show
    @user = User.find(params[:id])
    @activities = Activity.next_todos_for(@user)
  end
end
