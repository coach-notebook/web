require "rails_helper"

RSpec.describe "libraries/index", type: :view do
  before(:each) do
    assign(:libraries, [
      FactoryBot.create(:library),
      FactoryBot.create(:library),
    ])
  end

  it "renders a list of libraries" do
    render
  end
end
