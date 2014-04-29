require 'active_support/core_ext'
require 'webrick'
require_relative '../lib/rails_lite'


server = WEBrick::HTTPServer.new :Port => 8080
trap('INT') { server.shutdown }

class MyController < ControllerBase
  def go
    # render_content("hello world!", "text/html")
    # redirect_to("https://www.google.com")

    # after you have template rendering, uncomment:
   # render :show
   
   # render :test_ivars
  
    # after you have sessions going, uncomment:
   session["count"] ||= 0
   session["count"] += 5
   render :counting_show
  end
end

server.mount_proc '/' do |req, res|
  MyController.new(req, res).go
end

server.start
