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
  
  describe "PUT #update" do
    context "updating a party with valid information" do
      let(:party_attributes) { FactoryBot.attributes_for(:party) }

      it "should update party information to new information" do
        party = FactoryBot.create(:party)
        put :update, params: {id: party, party: party_attributes}
        expect(Party.find(1).attributes).to include(party_attributes.stringify_keys)
      end

      it "should redirect to party show page" do
        party = FactoryBot.create(:party)
        put :update, params: {id: party, party: party_attributes}
        expect(response).to redirect_to party
      end

      it "should have a notice of sucessful update of party information" do
        party = FactoryBot.create(:party)
        put :update, params: {id: party, party: party_attributes}
        expect(flash[:notice]).to eq "Party was successfully updated."
      end
    end

    context "updating a party with invalid information" do
      let(:invalid_party_attributes) { FactoryBot.attributes_for(:invalid_party) }

      it "should not update party information" do
        party = FactoryBot.create(:party)
        original_party_attributes = Party.where(id: 1).pluck(:name, :name_ab)
        put :update, params: {id: party, party: invalid_party_attributes}
        expect(Party.where(id: 1).pluck(:name, :name_ab)).to eq original_party_attributes
      end

      it "should redirect to party edit page" do
        party = FactoryBot.create(:party)
        put :update, params: {id: party, party: invalid_party_attributes}
        expect(response).to redirect_to edit_party_path(party)
      end
    end
  end

  describe "DELETE #destroy" do
    context "sucessfully deleting a party" do
      it "should decreases party count by one" do
        party = FactoryBot.create(:party)
        expect {
          delete :destroy, params: {id: party}
        }.to change(Party, :count).by(-1)
      end

      it "should pass a notice of successful deletion" do
        party = FactoryBot.create(:party)
        delete :destroy, params: {id: party}
        expect(flash[:notice]).to eq("Party was successfully destroyed.")
      end

      it "should redirect to parties list page" do
        party = FactoryBot.create(:party)
        delete :destroy, params: {id: party}
        expect(response).to redirect_to parties_url        
      end
    end
  end
end
