require 'rails_helper'

RSpec.describe "parties/show", type: :view do
  before(:each) do
    @party = assign(:party, Party.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
