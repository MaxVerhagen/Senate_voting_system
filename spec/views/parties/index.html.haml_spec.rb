require 'rails_helper'

RSpec.describe "parties/index", type: :view do
  before(:each) do
    assign(:parties, [
      Party.create!(),
      Party.create!()
    ])
  end

  it "renders a list of parties" do
    render
  end
end
