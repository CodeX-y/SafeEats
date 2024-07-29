class UserDietsController < ApplicationController
  before_action :set_user_diet, only: %i[ show edit update destroy ]

  # GET /user_diets or /user_diets.json
  def index
    @user_diets = UserDiet.all
  end

  # GET /user_diets/1 or /user_diets/1.json
  def show
    
  end

  # GET /user_diets/new
  def new
    @user_diet = UserDiet.new
  end

  # GET /user_diets/1/edit
  def edit
  end

  # POST /user_diets or /user_diets.json
  def create
    @user_diet = UserDiet.new(user_diet_params)
    @user_diet.user_id = current_user.id

    if @user_diet.save
      redirect_to @user_diet, { :notice => "User diet was successfully created." }
    else
      render "user_diets/new"
    end
  end

  # PATCH/PUT /user_diets/1 or /user_diets/1.json
  def update
    @user_diet = UserDiet.find(params.fetch("id"))
    @user_diet.user_id = current_user.id

    if @user_diet.update(user_diet_params)
      redirect_to @user_diet, { :notice => "User diet was successfully updated." }
    else
      render "user_diets/edit"
    end
  end

  # DELETE /user_diets/1 or /user_diets/1.json
  def destroy
    @user_diet.destroy!

    respond_to do |format|
      format.html { redirect_to user_diets_url, notice: "User diet was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_diet
      @user_diet = UserDiet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_diet_params
      params.require(:user_diet).permit(:user_id, :diet_id)
    end

    def user_diet_params
      params.require("user_diet").permit("diet_id")
    end
end
