require "rails_helper"

RSpec.describe "practices/form", type: :view do
  include_context :authorised_user

  before(:each) do
    assign(:practice, FactoryBot.build(:practice))
    def view.current_user
      FactoryBot.create(:user)
    end
  end

  it "renders new practice form" do
    render

    assert_select "form[action=?][method=?]", practices_path, "post" do
    end
  end
end
