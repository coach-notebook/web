require "rails_helper"

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/squads", type: :request do
  include_context :authorised_user
  # This should return the minimal set of attributes required to create a valid
  # Squad. As you add validations to Squad, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    FactoryBot.attributes_for :squad
  }

  let(:invalid_attributes) {
    FactoryBot.attributes_for :squad, name: nil
  }

  describe "GET /index" do
    it "renders a successful response" do
      FactoryBot.create(:squad, user: current_user)
      get squads_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      squad = FactoryBot.create(:squad, user: current_user)
      get squad_url(squad)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_squad_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      squad = FactoryBot.create(:squad, user: current_user)
      get edit_squad_url(squad)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Squad" do
        expect {
          post squads_url, params: { squad: valid_attributes }
        }.to change(Squad, :count).by(1)
      end

      it "redirects to the created squad" do
        post squads_url, params: { squad: valid_attributes }
        expect(response).to redirect_to(squad_url(Squad.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Squad" do
        expect {
          post squads_url, params: { squad: invalid_attributes }
        }.to change(Squad, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post squads_url, params: { squad: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { name: Faker::Lorem.name }
      }

      it "updates the requested squad" do
        squad = FactoryBot.create(:squad, user: current_user)
        patch squad_url(squad), params: { squad: new_attributes }
        squad.reload
        expect(squad.name).to eq(new_attributes[:name])
      end

      it "redirects to the squad" do
        squad = FactoryBot.create(:squad, user: current_user)
        patch squad_url(squad), params: { squad: new_attributes }
        squad.reload
        expect(response).to redirect_to(squad_url(squad))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        squad = FactoryBot.create(:squad, user: current_user)
        patch squad_url(squad), params: { squad: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested squad" do
      squad = FactoryBot.create(:squad, user: current_user)
      expect {
        delete squad_url(squad)
      }.to change(Squad, :count).by(-1)
    end

    it "redirects to the squads list" do
      squad = FactoryBot.create(:squad, user: current_user)
      delete squad_url(squad)
      expect(response).to redirect_to(squads_url)
    end
  end
end
