class LandingPageController < ApplicationController
  skip_before_action :authenticate_user!
  
  def landing
  end
end
