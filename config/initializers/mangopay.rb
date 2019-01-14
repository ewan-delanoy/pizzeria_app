MangoPay.configure do |c|
  c.preproduction = true
  c.client_id = ENV['MANGOPAY_ID']
  c.client_apiKey = ENV['MANGOPAY_APIKEY']
  c.log_file = File.join('.', 'mangopay.log')
  c.http_timeout = 10000
end
