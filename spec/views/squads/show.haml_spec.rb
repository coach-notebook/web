require "rails_helper"

RSpec.describe "squads/show", type: :view do
  include_context :authorised_user

  before(:each) do
    @squad = assign(:squad, FactoryBot.create(:squad, user: current_user))
  end

  it "renders attributes in <p>" do
    render
  end
end
