class UsersController < ApplicationController
  before_action :set_user, { :only => [:new] }

  def new
    render "user/diet"
  end

  private

    def set_user
      if params[:username]
        @user = User.find_by!(username: params.fetch(:username))
      else
        @user = current_user
      end
    end
end
