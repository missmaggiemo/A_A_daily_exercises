# "https://maps.googleapis.com/maps/api/place/nearbysearch/output?parameters"
require_relative 'load_keys'
require 'addressable/uri'
require 'rest-client'
require 'json'
require 'nokogiri'

def places_api_request(origin)
  Addressable::URI.new(
    :scheme => "https",
    :host => "maps.googleapis.com",
    :path => "maps/api/place/nearbysearch/json",
    :query_values => {
      key: API_KEY,
      location: origin.join(','),
      # radius: rad_in_met,
      sensor: false,
      keyword: "ice cream",
      rankby: "distance"
    }
  )
end


def geocode_api_request(address)
  Addressable::URI.new(
    :scheme => "https",
    :host => "maps.googleapis.com",
    :path => "maps/api/geocode/json",
    :query_values => {
      key: API_KEY,
      address: address,
      sensor: false
    }
  )
end

def dir_api_request(origin, dest)
  Addressable::URI.new(
    :scheme => "https",
    :host => "maps.googleapis.com",
    :path => "maps/api/directions/json",
    :query_values => {
      key: API_KEY,
      mode: "walking",
      origin: origin.join(','),
      destination: dest.join(','),
      sensor: false
    }
  )
end

def parse_json_from_uri(uri)
  JSON.parse(RestClient.get(uri.to_s))
end

def uri_to_json(uri)
  json = parse_json_from_uri(uri)
  loc = []
  loc << json["results"][0]["geometry"]["location"]["lat"]
  loc << json["results"][0]["geometry"]["location"]["lng"]
  loc
end

def directions_from_uri(uri)
  json = parse_json_from_uri(uri)
  json["routes"][0]["legs"][0]
end

def pretty_print_dirs(dirs)
  puts "Distance: #{dirs["distance"]["text"]}"
  puts "Duration: #{dirs["duration"]["text"]}"
  puts "Start: #{dirs["start_address"]}"
  puts "End: #{dirs["end_address"]}"

  dirs["steps"].each do |step|
    text =  Nokogiri::HTML(step["html_instructions"]).text
    puts text.gsub(/Destination/,"\nDestination")
  end
end