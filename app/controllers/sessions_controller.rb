class SessionsController < Clearance::SessionsController
  skip_before_action :require_login

  def root
      redirect_to user_url(current_user) if signed_in?
  end

  def create
    @user = authenticate(params)
    if @user.present?
      session[:pre_2fa_auth_user_id] = @user.id
      render json: { success: 'Signed in!' }
    else
      flash[:alert] = I18n.t("failure.InvalidLoginParams")
      @user ||= User.new(email: params[:email])
      render :new
    end
  end
end