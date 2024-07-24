class DietTypesController < ApplicationController
  before_action :set_diet_type, only: %i[ show edit update destroy ]

  # GET /diet_types or /diet_types.json
  def index
    @diet_types = DietType.all
  end

  # GET /diet_types/1 or /diet_types/1.json
  def show
  end

  # GET /diet_types/new
  def new
    @diet_type = DietType.new
  end

  # GET /diet_types/1/edit
  def edit
  end

  # POST /diet_types or /diet_types.json
  def create
    @diet_type = DietType.new(diet_type_params)

    respond_to do |format|
      if @diet_type.save
        format.html { redirect_to diet_type_url(@diet_type), notice: "Diet type was successfully created." }
        format.json { render :show, status: :created, location: @diet_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @diet_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diet_types/1 or /diet_types/1.json
  def update
    respond_to do |format|
      if @diet_type.update(diet_type_params)
        format.html { redirect_to diet_type_url(@diet_type), notice: "Diet type was successfully updated." }
        format.json { render :show, status: :ok, location: @diet_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @diet_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diet_types/1 or /diet_types/1.json
  def destroy
    @diet_type.destroy!

    respond_to do |format|
      format.html { redirect_to diet_types_url, notice: "Diet type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diet_type
      @diet_type = DietType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def diet_type_params
      params.require(:diet_type).permit(:name)
    end
end
