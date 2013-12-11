require_relative 'scrapable'

class AirConditioner
  include Scrapable

  def initialize(hostname)
    #@endpoint_uri = "http://#{hostname}/graphic/env.htm" unless hostname.nil?
  end

  scrapes_for :temperature, :humidity, from: "http://liebertac1.bobst.nyu.edu/graphic/env.htm"

  def scrape_attribute(attr, response)
    case attr
    when 'temperature'
      response.xpath('/*/script[2]').children.text.match(/deviceInfo\.temp=(\d.*);/)[1].to_f
    when 'humidity'
      response.xpath('/*/script[2]').children.text.match(/deviceInfo\.humid=(\d.*);/)[1].to_f
    end
  end
end
