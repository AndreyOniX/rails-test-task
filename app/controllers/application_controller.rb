class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def authorized
    unless logged_in?
      flash[:alert] = 'You must be logged.'
      redirect_to login_path
    end
  end

end
