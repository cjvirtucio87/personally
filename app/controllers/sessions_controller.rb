class SessionsController < ApplicationController
  # From ApplicationController
  skip_before_action :logged_in_user, except: [:destroy]
  skip_before_action :correct_user
  skip_before_action :has_business?

  # From SessionsController
  before_action :set_user, only: [:create]
  before_action :validate_credentials, only: [:create]
  before_action :redirect_logged_in, except: [:destroy]

  def new
  end
  
  def create
    log_in @user
    flash[:success] = 'Login successful.'
    if @user.business.present?
      redirect_to @user.business
    else
      flash[:info] = 'You have not yet set up your business information.'
      redirect_to new_business_path
    end
  end

  def destroy
    log_out if logged_in?
    flash[:success] = 'You are now logged out.'
    redirect_to login_path
  end

  private 
    def set_user
      @user = User.find_by(email: params[:session][:email])
    end

    def validate_credentials
      if @user.nil? || !@user.authenticate(params[:session][:password])
        flash[:danger] = 'Invalid username/password.'
        redirect_to login_path
      end
    end

    def redirect_logged_in
      if logged_in?
        # logged in but no business saved due to interrupted flow
        if current_user && current_user.business
          flash[:info] = "You are already logged in."
          redirect_to current_user.business
        else
          flash[:info] = "You have not yet set up your business info."
          redirect_to new_business_path
        end
      end
    end

end
