class SessionsController < ApplicationController
  
  before_action :set_user, only: [:create]
  before_action :validate_credentials, only: [:create]
  before_action :redirect_logged_in, except: [:destroy]

  def new
  end
  
  def create
    log_in @user
    flash[:success] = 'Login successful.'
    redirect_to @user.business
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
        flash[:info] = "You are already logged in."
        redirect_to current_user.business
      end
    end

end
