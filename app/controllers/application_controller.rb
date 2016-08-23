class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :logged_in?, 
                :current_user, 
                :logged_in_user

  ### SODA API ###
  def prep_soda
    @client = SODA::Client.new({domain: 'data.sfgov.org',app_token: Rails.application.secrets.socrata_api_key})
  end

  def query_soda(qparams)
    @client.get(Rails.application.secrets.data_set_id,qparams)
  end

  ### Authentication ###
  def log_in(user)
    session[:user_id] = user.id
  end

  def logged_in?
    !session[:user_id].nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def current_user
    # Conditional for whether the user is in session.
    if id = session[:user_id]
      @current_user ||= User.find_by(id: id)
    # Log user in if he's not in session, but has a remember_token in cookie.
    elsif id = cookies.signed[:user_id]
      user = User.find_by(id: id)
      token = cookies[:remember_token]
      if user && user.authenticated?(:remember,token)
        log_in user
        @current_user = user
      end
    end
  end

end
