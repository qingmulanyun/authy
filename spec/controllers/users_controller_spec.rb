require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "POST #create" do
    context "with valid attributes" do
      it "create new users" do
        old_user_count = User.count
        user_attributes = FactoryGirl.attributes_for(:user)
        post :create, user: user_attributes
        expect(User.count).to eq old_user_count + 1
      end
    end
  end

  describe "Patch update/:id" do
    let!(:user) { create(:user) }
    context "with valid attributes" do
      it "update user" do
        put :update,
            id: user.to_param,
            user: { 'first_name' => 'first_name_changed' }

        expect(user.first_name).to eq('first_name_changed')
      end
    end
  end
end