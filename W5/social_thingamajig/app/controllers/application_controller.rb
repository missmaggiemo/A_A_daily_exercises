class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper

  helper_method :form_auth_html, :patch_input_html, :current_user, :logged_in?

  def form_auth_html
    "<input type='hidden' name='authenticity_token' value='#{form_authenticity_token}' id='authenticity_token'>".html_safe
  end

  def patch_input_html
    "<input type='hidden' name='_method' value='patch'>".html_safe
  end


end
