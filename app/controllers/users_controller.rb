class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'Your account has been created. Enter business information.'
      log_in @user
      redirect_to new_business_path
    else
      flash[:danger] = 'Invalid information. Please try again to sign up.'
      redirect_to new_user_path
    end
  end

  private
    def user_params
      permissible_params = [:email,
                            :password]
      params.require(:user).permit(permissible_params)
    end
end
