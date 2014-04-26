module SessionsHelper
  
  def current_user
    user_session = Session.find_by_token(session[:session_token])
    return nil if user_session.nil? && @current_user.nil?
    @current_user || user_session.user
  end
  
  def current_user=(user)
    @current_user = user
    user_session = Session.create(user_id: user.id, token: Session.generate_token)
    session[:session_token] = user_session.token
  end
  
  def login(user)
    self.current_user = user
  end
  
  def logout_current_user!
    user_session = Session.find_by_token(session[:session_token])
    user_session.delete unless user_session.nil?
    session[:session_token] = nil
    Session.clean_up_sessions
  end
  
  def logged_in?
    !!current_user
  end
  
end
