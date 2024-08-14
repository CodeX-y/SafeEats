require "rails_helper"
require "devise"

RSpec.describe ComplianceController, type: :controller do
  let(:user) { User.create!(email: "johndoe@example.com", username: "johndoe", password: "password", diet_id: nil) }

  before do
    sign_in user
  end

  describe "GET #food" do
    context "when diet is not selected" do
      before do
        user.update(diet_id: nil)
      end

      it "redirects to select_diet_path with an alert message" do
        get :food
        expect(response).to redirect_to(select_diet_path)
        expect(flash[:alert]).to eq("Please select a diet type before choosing a meal.")
      end
    end

    context "when diet is selected" do
      before do
        user.update(diet_id: 1)
      end

      it "renders the food template" do
        get :food
        expect(response).to be_successful
        expect(response).to render_template(:food)
      end
    end
  end
end
