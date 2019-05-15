require 'rails_helper'

RSpec.describe "parties/edit", type: :view do
  before(:each) do
    @party = assign(:party, Party.create!())
  end

  it "renders the edit party form" do
    render

    assert_select "form[action=?][method=?]", party_path(@party), "post" do
    end
  end
end
