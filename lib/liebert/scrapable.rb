require 'rest-client'
require 'nokogiri'

module Scrapable
  # Create a summary of all attributes and values in a format digestable by Ganglia
  def all
    self.class::ATTRS.inject(String.new) do |string, attr|
      get_webpage
      self.class::ATTRS.each { |attr| eval("scrape_#{attr}") }
      string << "#{attr.capitalize}\t#{eval("@#{attr}")}\n"
    end
  end

  private

  # Dynamically create custom getters for each attribute that displays in a format digestable by Ganglia
  def create_getters
    self.class::ATTRS.each do |method_name|
      self.class.class_eval do
        define_method(method_name) do
          get_webpage
          eval("scrape_#{method_name}")
          "#{method_name.capitalize}\t#{eval("@#{method_name}")}"
        end
      end
    end
  end

  def get_webpage
    unless @parsed_response
      begin
        response = RestClient.get(self.endpoint_uri)
        @parsed_response = Nokogiri::HTML.parse(response.body)
      rescue
        raise "You forgot to set the hostname to your Liebert unit. More information can be found here: https://github.com/bswinnerton/liebert/blob/master/README.md"
      end
    end
    @parsed_response
  end
end
