class UsersController < ApplicationController
  # From ApplicationController
  skip_before_action :logged_in_user
  skip_before_action :correct_user
  skip_before_action :has_business?

  # From UsersController
  before_action :not_logged_in
  
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

    def not_logged_in
      if logged_in?
        flash[:notice] = "You are not authorized to access that page."
        redirect_to business_path(current_user.business)
      end
    end
end
