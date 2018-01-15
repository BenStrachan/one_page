class App::UsersController < App::BaseController

  before_action :set_user, only: [
    :edit, :update, :destroy, :resend_invitation, :accept
  ]

  def index
    @users = current_business.users
  end

  def new
    @user = current_business.users.new role: User::ROLE_ADMIN
  end

  def create
    @user = current_business.users.new user_params
    @user.password = Devise.friendly_token.first(10)
    if @user.save
      @user.invite!(current_user)
      redirect_to app_users_path, notice: "User has beed created successfully"
    else
      render :new
    end
  end

  def edit
  end

  def destroy
    @user.delete
    redirect_to app_users_path, notice: "User has beed deleted successfully"
  end

  def update
    if @user.update user_params
      if params[:user][:password].present? && @user.invited_to_sign_up?
        @user.accept_invitation!
      end
      redirect_to app_users_path, notice: "User has beed updated successfully"
    else
      render :edit
    end
  end

  def resend_invitation
    if @user.invited_to_sign_up?
      @user.invite!
      flash[:notice] = 'Invitation email has been sent to the user.'
    else
      flash[:alert] = 'The user has already accepted invitation.'
    end

    redirect_to app_users_path
  end

  def accept
  end

  private
  def set_user
    @user = current_business.users.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end