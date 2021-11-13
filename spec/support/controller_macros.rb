module ControllerMacros

  def sign_in_as(user)
    post '/login', params: {session: {username: user.username, password: 'password'}}
  end

end