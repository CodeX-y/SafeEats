class DietCompliancesController < ApplicationController
  def index
    matching_diet_compliances = DietCompliance.all

    @list_of_diet_compliances = matching_diet_compliances.order({ :created_at => :desc })

    render({ :template => "diet_compliances/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_diet_compliances = DietCompliance.where({ :id => the_id })

    @the_diet_compliance = matching_diet_compliances.at(0)

    render({ :template => "diet_compliances/show" })
  end

  def create
    the_diet_compliance = DietCompliance.new
    the_diet_compliance.ingredient_id = params.fetch("query_ingredient_id")
    the_diet_compliance.diet_id = params.fetch("query_diet_id")

    if the_diet_compliance.valid?
      the_diet_compliance.save
      redirect_to("/diet_compliances", { :notice => "Diet compliance created successfully." })
    else
      redirect_to("/diet_compliances", { :alert => the_diet_compliance.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_diet_compliance = DietCompliance.where({ :id => the_id }).at(0)

    the_diet_compliance.ingredient_id = params.fetch("query_ingredient_id")
    the_diet_compliance.diet_id = params.fetch("query_diet_id")

    if the_diet_compliance.valid?
      the_diet_compliance.save
      redirect_to("/diet_compliances/#{the_diet_compliance.id}", { :notice => "Diet compliance updated successfully."} )
    else
      redirect_to("/diet_compliances/#{the_diet_compliance.id}", { :alert => the_diet_compliance.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_diet_compliance = DietCompliance.where({ :id => the_id }).at(0)

    the_diet_compliance.destroy

    redirect_to("/diet_compliances", { :notice => "Diet compliance deleted successfully."} )
  end
end
