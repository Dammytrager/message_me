class SessionController < ApplicationController

  before_action :require_guest, except: [:destroy]
  before_action :require_login, only: [:destroy]

  def new
  end

  def create
    session_data = params[:session]
    user = User.find_by(username: session_data[:username])

    if user && user.authenticate(session_data[:password])
      # Create a new session and log user in
      session[:user_id] = user.id
      redirect_to root_path
    else
      set_error(message: 'Your login credentials are incorrect', now: true)
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

end
