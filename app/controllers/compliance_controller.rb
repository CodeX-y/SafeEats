class ComplianceController < ApplicationController
  def safe
    @ingredient = params[:ingredient]
    
    render "compliant/safe"
  end
end
