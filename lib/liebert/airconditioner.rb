require_relative 'scrapable'

class AirConditioner
  attr_accessor :endpoint_uri
  ATTRS = %i(temperature humidity)

  include Scrapable

  def initialize(endpoint_uri = nil)
    @endpoint_uri = endpoint_uri
    create_getters
  end

  def scrape_temperature
    @temperature = @parsed_response.xpath('/*/script[2]').children.text.match(/deviceInfo\.temp=(\d.*);/)[1].to_f
  end

  def scrape_humidity
    @humidity = @parsed_response.xpath('/*/script[2]').children.text.match(/deviceInfo\.humid=(\d.*);/)[1].to_f
  end
end
