require 'mollie-api-ruby'

begin
  limit   = 50
  methods = Mollie::Method.all(
    limit: limit,
    api_key: 'test_dHar4XY7LxsDOtmnkVtjNVWXLSlXsM'
  )
rescue Mollie::Exception => e
  puts 'An error has occurred: ' << e.message
end
