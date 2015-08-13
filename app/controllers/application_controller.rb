class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def authenticated?(auth_params)
    user = User.find_by(email: auth_params[:email])
    if user && user.authenticate(auth_params[:password])
      return true
    else
      return false
    end
  end

end


