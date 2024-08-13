class IngredientsController < ApplicationController
  before_action :set_ingredient, only: %i[ show edit update destroy ]
  require "csv"

  def index
    @ingredients = Ingredient.all
    authorize @ingredients
  end

  def show
    authorize @ingredient
  end

  def new
    @ingredient = Ingredient.new
    authorize @ingredient
  end

  def edit
    authorize @ingredient
  end

  def create
    authorize @ingredient
    @ingredient = Ingredient.new(ingredient_params)

    respond_to do |format|
      if @ingredient.save
        format.html { redirect_to ingredient_url(@ingredient), notice: "Ingredient was successfully created." }
        format.json { render :show, status: :created, location: @ingredient }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

def update
  authorize @ingredient

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

  def destroy
    authorize @ingredient
    @ingredient.destroy!

    respond_to do |format|
      format.html { redirect_to ingredients_url, notice: "Ingredient was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    def ingredient_params
      params.require(:ingredient).permit(:name, :vegetarian, :vegan)
    end
end
