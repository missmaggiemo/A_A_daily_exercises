require_relative 'request_access_token'


class TwitterSession
  # Both `::get` and `::post` should return the parsed JSON body.
  def self.get(path, query_values)
    # get request to URI?
    access_token.get(path_to_url(path, query_values).to_s).body
  end

  def self.post(path, req_params)
    # post request to URI?
    access_token.post(path_to_url(path, req_params).to_s)
  end

  def self.access_token
    @token ||= request_access_token
  end

  def self.request_access_token
    # We can serialize token to a file, so that future requests don't
    # need to be reauthorized.

    token_file = "lib/access_token.yml"

    if File.exist?(token_file)
      # reload token from file
      File.open(token_file) { |f| YAML.load(f) }
    else
      # copy the old code that requested the access token into a
      # `request_access_token` method.
      access_token = request_access_token
      File.open(token_file, "w") { |f| YAML.dump(access_token, f) }

      access_token
    end

  end

  def self.path_to_url(path, query_values = nil)
    # All Twitter API calls are of the format
    # "https://api.twitter.com/1.1/#{path}.json". Use
    # `Addressable::URI` to build the full URL from just the
    # meaningful part of the path (`statuses/user_timeline`)
    p Addressable::URI.new(
      :scheme => "https",
      :host => "api.twitter.com",
      :path => "1.1/#{path}.json",
      :query_values => query_values
    )
  end
end

# p TwitterSession.access_token
#
# p TwitterSession.get(
#   "statuses/user_timeline",
#   { screen_name: "magg_the_blonde" }
#   )
#
# path = "statuses/update"
# req_params = {
#   status: "Holy crap. This Twitter client works."
# }
#
# TwitterSession.post(path, req_params)