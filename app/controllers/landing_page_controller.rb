class LandingPageController < ApplicationController
  skip_before_action :authenticate_user!

  # index?
  def landing
  end
end
