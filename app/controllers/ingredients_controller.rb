class IngredientsController < ApplicationController
  before_action :set_ingredient, only: %i[ show edit update destroy ]
  require 'csv'

  # GET /ingredients or /ingredients.json
  def index
    @ingredients = Ingredient.all
    render "ingredients/index"
  end

  # GET /ingredients/1 or /ingredients/1.json
  def show
  end

  # GET /ingredients/new
  def new
    @ingredient = Ingredient.new
  end

  # GET /ingredients/1/edit
  def edit
  end

  # POST /ingredients or /ingredients.json
  def create
    ingredient_name = params.fetch("ingredient_name").strip.downcase
    csv_path = Rails.root.join('db', 'ingredients.csv')
    csv_data = CSV.read(csv_path, headers: true)

    matching_row = csv_data.find { |row| row['Ingredient'].strip.downcase == ingredient_name }

    if matching_row
      diet_type_name = matching_row['Diet Compliance'].strip.downcase
      diet_type = DietType.where('LOWER(name) = ?', diet_type_name).at(0)

      if diet_type
        @ingredient = Ingredient.new
        @ingredient.name = ingredient_name
        @ingredient.diet_id = diet_type.id

        if @ingredient.save
          redirect_to ingredients_path
        else
          render({ :template => "ingredients/new" })
        end
      else
        flash[:alert] = "Diet type not found for the ingredient in the CSV file."
        render({ :template => "ingredients/new" })
      end
    else
      flash[:alert] = "Ingredient not found in the CSV file."
      render({ :template => "ingredients/new" })
    end
  end

  # PATCH/PUT /ingredients/1 or /ingredients/1.json
  def update
    respond_to do |format|
      if @ingredient.update(ingredient_params)
        format.html { redirect_to ingredient_url(@ingredient), notice: "Ingredient was successfully updated." }
        format.json { render :show, status: :ok, location: @ingredient }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ingredients/1 or /ingredients/1.json
  def destroy
    @ingredient.destroy!

    respond_to do |format|
      format.html { redirect_to ingredients_url, notice: "Ingredient was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ingredient_params
      params.require(:ingredient).permit(:name, :vegetarian, :vegan)
    end
end
