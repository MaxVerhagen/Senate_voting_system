# spec/controllers/parties_controller_spec.rb
require 'rails_helper'

describe PartiesController, type: :controller do
    
  let(:valid_attributes) {{
    name: "the cool party",
    name_ab: "TCP"
  }}

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {
    "name" => "party 1",
    "name_ab" => "p1"
  } }

#  describe "GET #new" do
#    it "returns a success response" do
#      get :new, params: {}, session: valid_session
#      expect(response).to be_successful
#    end
#  end

  describe "POST #create" do
    context "adding a new party with valid parameters" do
      let(:party) { FactoryBot.create(:party) }
      let(:party_attributes) { FactoryBot.attributes_for(:party) }

      it "should increase party count" do
        expect {
          post :create, params: {party: party_attributes}
        }.to change(party, :count).by(1)
      end
    end

      # it "should add the candidate to the party" do
      #   post :create, params: {party_id: party.id, candidate: candidate_attributes}
      #   expect(party.candidates.pluck(:given_name)).to include candidate_attributes[:given_name]
      #   expect(party.candidates.pluck(:surname)).to include candidate_attributes[:surname]
      # end

      # it "should add the candidate at last position" do
      #   post :create, params: {party_id: party.id, candidate: candidate_attributes}
      #   new_party_candidate = Candidate.where(given_name: candidate_attributes[:given_name], surname: candidate_attributes[:surname])
      #   expect(new_party_candidate.first.party_pos).to be 0
      # end

  #     it "should redirect to the party show page" do
  #       post :create, params: {Party: party}
  #       expect(response).to redirect_to party
  #     end

  #     it "should have a successful creation notice message" do
  #       post :create, params: {party_id: party.id, candidate: candidate_attributes}
  #       expect(flash[:notice]).to eq("Candidate was successfully created.")
  #     end
  #   end

  #   context "adding a new candidate with invalid parameters" do
  #     let(:party) { FactoryBot.create(:party) }
  #     let(:invalid_candidate_attributes) { FactoryBot.attributes_for(:invalid_candidate, :party => party) }

  #     it "should not increase party candidate count" do
  #       expect {
  #         post :create, params: {party_id: party.id, candidate: invalid_candidate_attributes}
  #       }.not_to change(party.candidates, :count).from(0)
  #     end

  #     it "should redirect to candidate new page" do
  #       post :create, params: {party_id: party.id, candidate: invalid_candidate_attributes}
  #       expect(response).to redirect_to new_party_candidate_path(party)
  #     end
  #   end
  # end
  
#  describe "POST #create" do
#   context "with valid params" do
#      it "creates a new Party" do
#        expect {
#          post :create, {Party: valid_attributes}, valid_session
#        }.to change(Party, :count).by(1)
#      end

#      it "redirects to the created Party" do
#        post :create, params: {Party: valid_attributes}, session: valid_session
#        expect(response).to redirect_to(Party.last)
#      end
#    end

#    context "with invalid params" do
#      it "returns a success response (i.e. to display the 'new' template)" do
#        post :create, params: {Party: invalid_attributes}, session: valid_session
#        expect(response).to be_successful
#      end
#    end
#  end

end
