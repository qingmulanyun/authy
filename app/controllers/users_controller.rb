class UsersController < Clearance::UsersController
  before_action :get_current_user, only: [:show, :edit, :update]

  def show
    authorize @user, :show?
  end

  def edit
    authorize @user, :edit?
    respond_to do |format|
      format.html { render :edit }
      format.js
    end
  end

  def update
    authorize @user, :update?
    @user.attributes = user_params
    if @user.phone_changed? || @user.email_changed?
      authy = AuthyServices::RegistUser.new(@user).regist_user
      @user.attributes = user_params.merge(authy_id: authy.id)
    end
    respond_to do |format|
      if  @user.save!
        flash.now[:alert] = I18n.t("success.UserUpdateSuccess")
        format.html { redirect_to @user, notice: 'User Successfully Updated!' }
        format.js
      end
    end
  end

  def create
    @user = User.new(user_params)
    authorize @user, :create?
    if @user.save!
      authy = AuthyServices::RegistUser.new(@user).regist_user
      if authy.ok?
        @user.update(authy_id: authy.id)
        flash[:notice] = I18n.t("success.SignUpSuccess")
        redirect_to sign_in_path
      else
        authy.errors
      end
    else
      render :new
    end
  end

  private

  def user_params
    params[:user].permit(:email, :password, :first_name, :last_name, :phone, :country_code)
  end

  def get_current_user
    @user = current_user
  end
end