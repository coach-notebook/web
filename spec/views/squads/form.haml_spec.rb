require "rails_helper"

RSpec.describe "squads/form", type: :view do
  include_context :authorised_user

  before(:each) do
    assign(:squad, FactoryBot.build(:squad, user: current_user))
  end

  it "renders new squad form" do
    render

    assert_select "form[action=?][method=?]", squads_path, "post" do
    end
  end
end
