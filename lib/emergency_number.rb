require_relative 'emergency_number/version.rb'
require_relative 'normalize'
require "httparty"

module EmergencyNumber
  include HTTParty
  base_uri 'http://emergencynumberapi.com/api/country'

  def self.get_country(code = :us)
    response = self.get("/#{code}/")
    body = JSON.parse(response.body)
    body.extend(Normalize)
  end
end
