require "rails_helper"

RSpec.describe "practices/show" do
  include_context :authorised_user

  before(:each) do
    @practice = assign(:practice, FactoryBot.create(:practice))
    def view.current_user
      FactoryBot.create(:user)
    end
  end

  it "renders attributes in <p>" do
    render
  end
end
