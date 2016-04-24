$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'emergency_number'
require 'webmock/rspec'
WebMock.disable_net_connect!(allow_localhost: true)
RSpec.configure do |config|
  config.before(:each) do
    # US
    stub_request(:get, %r|http://emergencynumberapi.com/api/country/us/|)
      .to_return(
        status: 200,
        body: File.open('./spec/fixtures/us_response.json', &:read),
        headers: {}
      )

    # AQ
    stub_request(:get, %r|http://emergencynumberapi.com/api/country/aq/|)
      .to_return(
        status: 200,
        body: File.open('./spec/fixtures/us_response.json', &:read),
        headers: {}
      )

    # Invalid
    stub_request(:get, %r|http://emergencynumberapi.com/api/country/hello/|)
      .to_return(
        status: 200,
        body: File.open('./spec/fixtures/us_response.json', &:read),
        headers: {}
      )
  end
end
