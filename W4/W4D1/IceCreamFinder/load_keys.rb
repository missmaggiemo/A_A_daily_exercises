API_KEY = nil
begin
  API_KEY = File.read('.api_key').chomp
rescue
  puts "Unable to read '.api_key'. Please provide a valid Google API key."
  exit
end