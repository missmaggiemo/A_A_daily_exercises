require_relative 'apis'

puts "enter your current location (street address)"
curr_loc = "1061 Market St, San Francisco, CA"
puts curr_loc
geocode_url = geocode_api_request(curr_loc)
# make a request

origin = uri_to_json(geocode_url)
puts "origin: #{origin}"

places_url = places_api_request(origin)
dest = uri_to_json(places_url)
puts "dest: #{dest}"


dir_url = dir_api_request(origin, dest)
# origin = geocoding(curr_loc)

# puts dir_url

dirs = directions_from_uri(dir_url)

# puts dirs

pretty_print_dirs(dirs)

# puts dir_url

puts ice_cream = "ICE CREAM!!!!"
# dest = find(ice_cream)

# directions(origin, dest)