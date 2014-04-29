require 'webrick'
require 'json'


server = WEBrick::HTTPServer.new :Port => 3000

$cats = []

server.mount_proc("/") do |req, res|

  if req.path == "/cats" && req.request_method == "POST"
    # make cat
    params = JSON.parse(body)
    new_cat = params['cat']
    $cats << new_cat.to_json
    res.body = new_cat.to_json
  elsif req.path == "/cats" && req.request_method == "GET"
    res.body = $cats.to_json
  end
  
end





server.mount_proc("/") do |req, res|

  if req.path == "/"
    count = 0
    
    req.cookies.each do |cookie|
      if cookie.name == "my_counter"
        count = Integer(cookie.value)
    end
  end
  
  res.body = "Count is #{count}."
  res.cookies << WEBrick::Cookie.new("my_counter", (count += 1).to_s)

end


server.mount_proc("/") do |req, res|

  if req.path == "/dogs"
    # 302 redirect status
    res.status = 302
    # set redirect location in header
    res["Location"] = "/cats"
  elsif req.path == "/cats"
    res.body = "WELCOME TO CATS"
  end

end

trap('INT') { server.shutdown }

# server.start

require 'erb'

template = <<-ERB
  First ten squares: <%= (1..10).to_a.map { |i| i * i } %>
  
  Current time: <%= Time.now %>
  
ERB

compiled_template = ERB.new(template)
# this produces code that we can run (later)-- doesn't run immediately
# the compiled template is its own little method-world-- it doesn't know about vars outside of it unless you pass them in
# binding

puts compiled_template.result



# notes on binding

# binding captures variables

def f
  x = 3
  b = binding()
  b
end
# => nil
f
# => #<Binding:0x000001028ad2e0>
b = f()
# => #<Binding:0x00000101926b00>
b.eval("x")
# => 3
def f
  x = 3
  b = binding()
  x = 4
  b
end
# => nil
b = f()
# => #<Binding:0x000001012cf360>
b.eval("x")
# => 4








# binding captures ivars


class Cat
  def initialize(name)
    @name = name
  end
  
  def render
    b = binding()
    b.eval("@name")
  end
end
