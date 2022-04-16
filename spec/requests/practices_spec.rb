require "rails_helper"

RSpec.describe "/practices", type: :request do
  include_context :authorised_user

  let(:squad) {
    FactoryBot.create(:squad, user: current_user)
  }
  let(:valid_attributes) {
    FactoryBot.attributes_for(:practice, squad_id: squad.id)
  }

  let(:invalid_attributes) {
    FactoryBot.attributes_for(:practice, practice_at: nil)
  }

  describe "GET /index" do
    it "renders a successful response" do
      FactoryBot.create(:practice)
      get practices_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      practice = FactoryBot.create(:practice)
      get practice_path(practice)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_practice_path
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      practice = FactoryBot.create(:practice)
      get edit_practice_path(practice)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Practice" do
        expect {
          post practices_url, params: { practice: valid_attributes }
        }.to change(Practice, :count).by(1)
      end

      it "redirects to the created practice" do
        post practices_url, params: { practice: valid_attributes }
        expect(response).to redirect_to(practice_path(Practice.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Practice" do
        expect {
          post practices_url, params: { practice: invalid_attributes }
        }.to change(Practice, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post practices_url, params: { practice: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { practice_at: 2.weeks.from_now }
      }

      it "updates the requested practice" do
        practice = FactoryBot.create(:practice)
        patch practice_path(practice), params: { practice: new_attributes }
        practice.reload
        format = "%Y%m%d%H%i"
        expect(practice.practice_at.strftime(format)).to eq(new_attributes[:practice_at].strftime(format))
      end

      it "redirects to the practice" do
        practice = FactoryBot.create(:practice)
        patch practice_path(practice), params: { practice: new_attributes }
        practice.reload
        expect(response).to redirect_to(practice_path(practice))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        practice = FactoryBot.create(:practice)
        patch practice_path(practice), params: { practice: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested practice" do
      practice = FactoryBot.create(:practice)
      expect {
        delete practice_path(practice)
      }.to change(Practice, :count).by(-1)
    end

    it "redirects to the practices list" do
      practice = FactoryBot.create(:practice)
      delete practice_path(practice)
      expect(response).to redirect_to(practices_url)
    end
  end
end
