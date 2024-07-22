class DietTypesController < ApplicationController
  def index
    matching_diet_types = DietType.all

    @list_of_diet_types = matching_diet_types.order({ :created_at => :desc })

    render({ :template => "diet_types/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_diet_types = DietType.where({ :id => the_id })

    @the_diet_type = matching_diet_types.at(0)

    render({ :template => "diet_types/show" })
  end

  def create
    the_diet_type = DietType.new
    the_diet_type.name = params.fetch("query_name")

    if the_diet_type.valid?
      the_diet_type.save
      redirect_to("/diet_types", { :notice => "Diet type created successfully." })
    else
      redirect_to("/diet_types", { :alert => the_diet_type.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_diet_type = DietType.where({ :id => the_id }).at(0)

    the_diet_type.name = params.fetch("query_name")

    if the_diet_type.valid?
      the_diet_type.save
      redirect_to("/diet_types/#{the_diet_type.id}", { :notice => "Diet type updated successfully."} )
    else
      redirect_to("/diet_types/#{the_diet_type.id}", { :alert => the_diet_type.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_diet_type = DietType.where({ :id => the_id }).at(0)

    the_diet_type.destroy

    redirect_to("/diet_types", { :notice => "Diet type deleted successfully."} )
  end
end
