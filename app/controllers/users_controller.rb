class UsersController < ApplicationController
  before_action :set_user

  private

  def set_user
    if params[:username]
      @user = User.find_by!(username: params[:username])
    else
      @user = current_user
    end
  end
end
