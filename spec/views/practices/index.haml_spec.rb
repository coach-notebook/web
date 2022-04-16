require "rails_helper"

RSpec.describe "practices/index", type: :view do
  include_context :authorised_user

  before(:each) do
    assign(:practices, [
      FactoryBot.create(:practice),
      FactoryBot.create(:practice),
    ])
  end

  it "renders a list of practices" do
    render
  end
end
