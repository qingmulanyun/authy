require 'rails_helper'

RSpec.describe VerifyController, type: :controller do

  describe 'request verify token' do
    let!(:user) { create(:user) }

    context 'via sms' do
      before do
        session[:pre_2fa_auth_user_id] = user.id
      end

      it 'send token' do
        post :send_token_sms
        resp = JSON.parse(response.body)
        expect(resp['success']).to eq('Token has been sent via SMS!')
      end
    end

    context 'via phone call' do
      before do
        session[:pre_2fa_auth_user_id] = user.id
      end

      it 'send token' do
        post :send_token_phone_call
        resp = JSON.parse(response.body)
        expect(resp['success']).to eq('Token has been sent via phone!')
      end
    end

    context 'verify' do
      authy = {"message"=>"Token is valid.",
               "token"=>"is valid",
               "success"=>"true",
               "device"=>
                   {"id"=>nil,
                    "os_type"=>"sms",
                    "registration_date"=>1498965683,
                    "registration_method"=>nil,
                    "registration_country"=>nil,
                    "registration_region"=>nil,
                    "registration_city"=>nil,
                    "country"=>nil,
                    "region"=>nil,
                    "city"=>nil,
                    "ip"=>nil,
                    "last_account_recovery_at"=>nil
                   }
      }


      before do
        session[:pre_2fa_auth_user_id] = user.id
      end

      subject { post :verify, token: 'test token' }

      it "Successfully" do
        allow_any_instance_of(VerifyController).to receive(:call_vefiry_api).and_return(authy)
        subject.should redirect_to(root_path)
      end
    end
  end
end