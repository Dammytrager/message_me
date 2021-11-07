class ApplicationController < ActionController::Base
  include ApplicationHelper

  private

  def set_error(message:, now: false)
    flash.now[:error] if now
    flash[:error] = message
  end

  def set_success(message:, now: false)
    flash.now[:success] if now
    flash[:success] = message
  end

  def require_login
    if !logged_in?
      set_error(message: 'You need to log in')
      redirect_to login_path
    end
  end

  def require_guest
    if logged_in?
      redirect_to root_path
    end
  end

end
