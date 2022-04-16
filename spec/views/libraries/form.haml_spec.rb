require "rails_helper"

RSpec.describe "libraries/form", type: :view do
  before(:each) do
    @library = assign(:library, FactoryBot.create(:library))
  end

  it "renders the edit library form" do
    render

    assert_select "form[action=?][method=?]", library_path(@library), "post" do
    end
  end
end
