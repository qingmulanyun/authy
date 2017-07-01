module AuthyServices
  class RegistUser

    def initialize(user)
      @user = user
    end

    def regist_user
      Authy::API.register_user(
          email: @user.email,
          cellphone: @user.phone,
          country_code: @user.country_code
      )
    end
  end
end