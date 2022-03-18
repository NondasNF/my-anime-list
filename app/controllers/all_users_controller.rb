class AllUsersController < ApplicationController
  before_action :set_user, only: %i[ destroy admin]
  before_action :authenticate_user!
  def index
    @users = User.all
  end

  def destroy
    @user.destroy
    redirect_back(notice: "You successfully deleted!", fallback_location: root_path)
  end

  def admin
    @user.admin = true
    @user.save
    redirect_back(notice: "New admin added!", fallback_location: root_path)
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

end
