
CONSUMER_KEY = nil
CONSUMER_SECRET = nil
begin
  api_info = File.readlines('./lib/api_key').map(&:chomp)
  CONSUMER_KEY = api_info[0]
  CONSUMER_SECRET = api_info[1]
rescue
  puts "Unable to read 'api_key'. Please provide a valid Twitter API key."
  exit
end

CONSUMER = OAuth::Consumer.new(
  CONSUMER_KEY, CONSUMER_SECRET, :site => "https://twitter.com")

# "Consumer" in Twitter terminology means "client" in our discussion.
# God only knows who thought it was a good idea to make up many terms
# for the same thing.
def request_access_token
  # An `OAuth::Consumer` object can make requests to the service on
  # behalf of the client application.

  # Ask service for a URL to send the user to so that they may authorize
  # us.
  request_token = CONSUMER.get_request_token
  authorize_url = request_token.authorize_url

  # Launchy is a gem that opens a browser tab for us
  Launchy.open(authorize_url)

  # Because we don't use a redirect URL; user will receive a short PIN
  # (called a **verifier**) that they can input into the client
  # application. The client asks the service to give them a permanent
  # access token to use.
  puts "Login, and type your verification code in"
  oauth_verifier = gets.chomp
  access_token = request_token.get_access_token(
    :oauth_verifier => oauth_verifier
  )
end