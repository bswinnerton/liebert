require_relative 'scrapable'

class AirConditioner
  attr_accessor :endpoint_uri
  ATTRS = %i(temperature humidity)

  include Scrapable

  def initialize(endpoint_uri)
    @endpoint_uri = endpoint_uri

    create_getters
    if get_webpage
      ATTRS.each { |attr| eval "scrape_#{attr}" }
    end
  end

  def scrape_temperature
    @temperature = @parsed_response.xpath('/*/script[2]').children.text.match(/deviceInfo\.temp=(\d.*);/)[1].to_f
  end

  def scrape_humidity
    @humidity = @parsed_response.xpath('/*/script[2]').children.text.match(/deviceInfo\.humid=(\d.*);/)[1].to_f
  end
end
