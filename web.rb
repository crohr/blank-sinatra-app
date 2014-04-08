require 'sinatra'
require 'net/http'
require 'uri'

get '/' do
  uri = URI(ENV.fetch('HELLO_URL') { 'https://api.github.com/rate_limit' })
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  response = http.request(Net::HTTP::Get.new(uri.request_uri))

  "Hello, world. Here is the rate limiting response from Github: #{response.body.inspect}\n"
end
