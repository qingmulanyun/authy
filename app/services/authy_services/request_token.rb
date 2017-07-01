module AuthyServices
  class RequestToken

    def initialize(user)
      @user = user
    end

    def send_token_via_sms
      Authy::API.request_sms(id: @user.authy_id, force: true)
    end

    def send_token_via_phone_call
      Authy::API.request_phone_call(id: @user.authy_id, force: true)
    end
  end
end