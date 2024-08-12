class BarcodeController < ApplicationController
  # skip_before_action :verify_authenticity_token, only: :create

  def index
    # This action will render app/views/barcode/index.html.erb
  end

  def create
    upc_code = params[:upc]
    # Process the UPC code as needed
    render json: { success: true, upc: upc_code }
  end
end
