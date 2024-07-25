class DietCompliancesController < ApplicationController
  before_action :set_diet_compliance, only: %i[ show edit update destroy ]

  # GET /diet_compliances or /diet_compliances.json
  def index
    @diet_compliances = DietCompliance.all
  end

  # GET /diet_compliances/1 or /diet_compliances/1.json
  def show
  end

  # GET /diet_compliances/new
  def new
    @diet_compliance = DietCompliance.new
  end

  # GET /diet_compliances/1/edit
  def edit
  end

  # POST /diet_compliances or /diet_compliances.json
  def create
    @diet_compliance = DietCompliance.new(diet_compliance_params)

    respond_to do |format|
      if @diet_compliance.save
        format.html { redirect_to diet_compliance_url(@diet_compliance), notice: "Diet compliance was successfully created." }
        format.json { render :show, status: :created, location: @diet_compliance }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @diet_compliance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diet_compliances/1 or /diet_compliances/1.json
  def update
    respond_to do |format|
      if @diet_compliance.update(diet_compliance_params)
        format.html { redirect_to diet_compliance_url(@diet_compliance), notice: "Diet compliance was successfully updated." }
        format.json { render :show, status: :ok, location: @diet_compliance }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @diet_compliance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diet_compliances/1 or /diet_compliances/1.json
  def destroy
    @diet_compliance.destroy!

    respond_to do |format|
      format.html { redirect_to diet_compliances_url, notice: "Diet compliance was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diet_compliance
      @diet_compliance = DietCompliance.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def diet_compliance_params
      params.require(:diet_compliance).permit(:ingredient_id, :diet_id)
    end
end