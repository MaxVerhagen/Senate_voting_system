# spec/controllers/parties_controller_spec.rb
require 'rails_helper'

describe PartiesController, type: :controller do
    
  let(:valid_attributes) {{
    name: "The cool party",
    name_ab: "TCP"
  }}

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end
  
  describe "POST #create" do
    context "with valid params" do
      it "creates a new Party" do
        expect {
          post :create, params: {Party: valid_attributes}, session: valid_session
        }.to change(Party, :count).by(1)
      end

      it "redirects to the created Party" do
        post :create, params: {Party: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Party.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {Party: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

end
