# script!
# We'll be using it to make requests to our Rails app. We'll be able to run this script with the ruby command.

require 'addressable/uri'
require 'rest-client'

def create_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.json'
  ).to_s

  puts RestClient.post(
      url,
      { :user => { :name => 'Joe', :email => "joe@gizmo.gizmo" } }
    )
end


def update_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: "/users/8.json"
  ).to_s

  puts RestClient.put(
      url,
      { :user => { :name => "Tom" } }
    )

end

def destroy_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: "/users/8.json"
  ).to_s

  puts RestClient.delete(url)

end
# create_user

destroy_user

# p User.all
#
# update_user(User.find_by(:name => "Joe"), { :name => "Tom" } )
#
# p User.all