require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "Root" do
    let!(:user) { create(:user) }
    subject { get :root }
    before do
      sign_in_as(user)
    end

      it "sign in" do
        subject.should redirect_to(user_url(user))
      end
  end

  describe "create" do
    let!(:user) { create(:user) }

    it "sign in" do
      post :create, session: { email: user.email, password: user.password }
      resp = JSON.parse(response.body)
      expect(resp['success']).to eq('Signed in!')
    end
  end
end