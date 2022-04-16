require "rails_helper"

RSpec.describe "squads/index", type: :view do
  include_context :authorised_user

  before(:each) do
    assign(:squads, [
      FactoryBot.create(:squad),
      FactoryBot.create(:squad),
    ])
  end

  it "renders a list of squads" do
    render
  end
end
