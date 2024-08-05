class DietTypesController < ApplicationController
  before_action :set_diet_type, only: %i[ show edit update destroy ]

  def index
    @diet_types = DietType.all
  end

  def show
  end

  def new
    @diet_type = DietType.new
  end

  def edit
  end

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

  def destroy
    @diet_type.destroy!

    respond_to do |format|
      format.html { redirect_to diet_types_url, notice: "Diet type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_diet_type
      @diet_type = DietType.find(params[:id])
    end

    def diet_type_params
      params.require(:diet_type).permit(:name)
    end
end
