require_relative 'emergency_number/version.rb'
require_relative 'normalize'
require 'httparty'

# Helps fetch JSON data from API call and returns easy to work with object.
module EmergencyNumber
  module_function

  include HTTParty
  # Sets the base_uri for making GET calls to Emergency Number API.
  base_uri 'http://emergencynumberapi.com/api/country'

  # Fetches list of Emergency Numbers from the Emergency Number API service.
  #
  # @param code [Symbol] the language code.
  # @return [Hash] returned as Hash object in normalized dot notation form.
  #
  # @example Get list of number for Australia
  #   EmergencyNumber.get_country(:au)
  def get_country(code = :us)
    response = get("/#{code}/")
    body = JSON.parse(response.body, symbolize_names: true)
    body.extend(Normalize)
  end
end
