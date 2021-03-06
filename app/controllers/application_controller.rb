class ApplicationController < ActionController::Base
  include SessionsHelper
  protect_from_forgery

  before_filter :require_login
  skip_before_filter :require_login, :only => [:index, :show]

  protected

  def require_login
    unless logged_in?
      flash[:error] = ["You must be logged in to access this section"]
      redirect_to new_session_url
    end
  end
end
