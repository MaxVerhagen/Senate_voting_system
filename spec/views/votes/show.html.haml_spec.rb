require 'rails_helper'

RSpec.describe "votes/show", type: :view do
  before(:each) do
    @vote = assign(:vote, Vote.create!(
      :preference => "Preference"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Preference/)
  end
end
