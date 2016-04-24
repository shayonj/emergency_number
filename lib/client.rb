require 'httparty'
require_relative 'normalize.rb'

module EmergencyNumber
  class Client
    include HTTParty
    base_uri 'http://emergencynumberapi.com/api/country'
    attr_accessor :code

    def initialize(code = :us)
      @code = code
    end

    def get_country(code = :us)
      response = self.class.get("/#{code}/")
      body = JSON.parse(response.body)
      body.extend(Normalize)
    end
  end
end
