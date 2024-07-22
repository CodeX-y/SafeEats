class UserDietsController < ApplicationController
  def index
    matching_user_diets = UserDiet.all

    @list_of_user_diets = matching_user_diets.order({ :created_at => :desc })

    render({ :template => "user_diets/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_user_diets = UserDiet.where({ :id => the_id })

    @the_user_diet = matching_user_diets.at(0)

    render({ :template => "user_diets/show" })
  end

  def create
    the_user_diet = UserDiet.new
    the_user_diet.user_id = params.fetch("query_user_id")
    the_user_diet.diet_id = params.fetch("query_diet_id")

    if the_user_diet.valid?
      the_user_diet.save
      redirect_to("/user_diets", { :notice => "User diet created successfully." })
    else
      redirect_to("/user_diets", { :alert => the_user_diet.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_user_diet = UserDiet.where({ :id => the_id }).at(0)

    the_user_diet.user_id = params.fetch("query_user_id")
    the_user_diet.diet_id = params.fetch("query_diet_id")

    if the_user_diet.valid?
      the_user_diet.save
      redirect_to("/user_diets/#{the_user_diet.id}", { :notice => "User diet updated successfully."} )
    else
      redirect_to("/user_diets/#{the_user_diet.id}", { :alert => the_user_diet.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_user_diet = UserDiet.where({ :id => the_id }).at(0)

    the_user_diet.destroy

    redirect_to("/user_diets", { :notice => "User diet deleted successfully."} )
  end
end
