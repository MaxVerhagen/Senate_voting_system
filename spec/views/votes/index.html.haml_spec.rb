require 'rails_helper'

RSpec.describe "votes/index", type: :view do
  before(:each) do
    assign(:votes, [
      Vote.create!(
        :preference => "Preference"
      ),
      Vote.create!(
        :preference => "Preference"
      )
    ])
  end

  it "renders a list of votes" do
    render
    assert_select "tr>td", :text => "Preference".to_s, :count => 2
  end
end
