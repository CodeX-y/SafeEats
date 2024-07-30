class HomepageController < ApplicationController
  before_action :set_user

  def select_diet
    render "home/diet"
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
