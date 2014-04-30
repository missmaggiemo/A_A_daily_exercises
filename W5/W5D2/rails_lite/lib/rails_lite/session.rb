require 'json'
require 'webrick'

class Session
  # find the cookie for this app
  # deserialize the cookie into a hash
  def initialize(req)   
    set_cookies(req)
  end

  def [](key)
    @cookies[key]
  end

  def []=(key, val)
    @cookies[key] = val
  end

  # serialize the hash into json and save in a cookie
  # add to the responses cookies
  def store_session(res)    
    res.cookies << WEBrick::Cookie.new("_rails_lite_app", @cookies.to_json)
  end
  
  private
  
  def set_cookies(req)
    cookies_array = req.cookies.select { |cookie| cookie.name.match('_rails_lite_app') }
    @cookies = {}
    unless cookies_array.empty?
      cookies_array.each do |cookie|
        cookie_hash = JSON.parse(cookie.value)
        @cookies.merge!(cookie_hash)
      end
    end
  end

end
