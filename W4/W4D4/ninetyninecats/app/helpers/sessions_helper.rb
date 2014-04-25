module SessionsHelper
  def current_user
    user_session = Session.find_by_token(session[:session_token])
    return nil if user_session.nil?
    @current_user ||= User.find(user_session.user_id)
  end

  def current_user=(user)
    @current_user = user
    session[:session_token] = user.generate_session_token(process_request_env)
  end

  def login_user!(user)
    self.current_user = user
    user.cleanup_sessions
  end

  def process_request_env
    user_agent_data = request.env["HTTP_USER_AGENT"]
    if user_agent_data
      return user_agent_data.match(/\(.*\;/).to_s.gsub('(', '').gsub(';', '')
    end
    "Uncategorized Device"
  end

end