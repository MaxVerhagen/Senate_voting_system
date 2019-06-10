# spec/controllers/parties_controller_spec.rb
require 'rails_helper'

describe PartiesController, type: :controller do
    

  describe "POST #create" do
    context "adding a new party with valid parameters" do
      let(:party) { FactoryBot.create(:party) }
      let(:party_attributes) { FactoryBot.attributes_for(:party) }

      it "should increase party count" do
        expect {
          post :create, params: {party: party_attributes}
        }.to change(Party, :count).by(1)
      end
      
       it "should redirect to the party show page" do
         post :create, params: {party: party_attributes}
         expect(response).to redirect_to(Party.last)
       end
    end
  end
end
