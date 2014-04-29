module SessionsHelper

  def current_user=(user)
    @current_user = user
    session[:token] = Session.generate_session_token(user)
  end

  def current_user
    current_session = Session.find_by_token(session[:token])
    if current_session
      @current_user ||= current_session.user
    end
  end

  def login_user!(user)
    self.current_user = user
  end

  def logged_in?
    !!current_user
  end

  def log_out!
    current_token = Session.find_by_token(session[:token])
    if current_token
      current_token.delete
    end
    session[:token] = nil
  end

end
