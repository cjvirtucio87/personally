class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Methods to be made available to the view.
  helper_method :logged_in?, 
                :current_user, 
                :logged_in_user

  ### Callbacks ###
  before_action :logged_in_user
  before_action :correct_user


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
    if id = session[:user_id]
      @current_user ||= User.find_by(id: id)
    end
  end

  def correct_user
    unless current_user.nil?
      case current_user.id
      when params[:id].to_i, params[:user_id].to_i
        return true
      else
        flash[:notice] = "You are not authorized to access that page."
        redirect_to root_url
      end
    end
  end

  def logged_in_user
    if !logged_in?
      flash[:notice] = "You must first log in."
      redirect_to login_path 
    end
  end


end
