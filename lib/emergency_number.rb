require_relative 'emergency_number/version.rb'
require_relative 'client'

module EmergencyNumber
  def self.client
    @client ||= Client.new
  end

  def self.get_country(code = :us)
    client.get_country(code)
  end
end
