class UsersController < ApplicationController
  before_action :require_signin

  def show
    @user = User.find(params[:id])
  end
end
