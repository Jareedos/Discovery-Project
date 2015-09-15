class ApplicationController < ActionController::Base

  def current_user
    @user || User.find_by_id(session[:user_id]) if session[:user_id]
  end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  around_filter :set_time_zone

  def set_time_zone(&block)
    #time_zone = current_user.try(:timezone).upcase || 'UTC'
    time_zone = 'Arizona'
    Time.use_zone(time_zone, &block)
  end
end
