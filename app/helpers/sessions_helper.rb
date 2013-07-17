module SessionsHelper
  def login(user)
    token = SecureRandom.urlsafe_base64
    session[:session_token] = token
    user.update_attribute(:session_token, token)
  end

  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def logged_in?
    !!current_user
  end

  def logout
    return nil unless current_user
    current_user.update_attribute(:session_token, nil)
    session[:session_token] = nil
  end
end