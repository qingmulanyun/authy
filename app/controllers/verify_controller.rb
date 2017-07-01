class VerifyController < ApplicationController
  skip_before_action :require_login
  before_action :get_session_user

  def send_token_sms
    AuthyServices::RequestToken.new(@user).send_token_via_sms
    render json: { success: 'Token has been sent via SMS!' }
  end

  def send_token_phone_call
    AuthyServices::RequestToken.new(@user).send_token_via_phone_call
    render json: { success: 'Token has been sent via phone!' }
  end

  def verify
    @user = User.find(session[:pre_2fa_auth_user_id])
    token = call_vefiry_api
    debugger
    if token.ok?
      sign_in(@user)
      flash[:notice] =  I18n.t("success.SignInSuccess")
      redirect_to '/'
    else
      flash[:alert] =  I18n.t("failure.InvalidLoginToken")
      redirect_to sign_in_path
    end
  end

  private

  def get_session_user
    @user = User.find(session[:pre_2fa_auth_user_id])
  end

  def call_vefiry_api
    Authy::API.verify(id: @user.authy_id, token: params[:token])
  end
end
