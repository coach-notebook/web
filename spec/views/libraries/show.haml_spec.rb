require "rails_helper"

RSpec.describe "libraries/show", type: :view do
  before(:each) do
    @library = assign(:library, FactoryBot.create(:library))
  end

  it "renders attributes in <p>" do
    render
  end
end
