require 'rest-client'
require 'nokogiri'

module Scrapable
  # Create a summary of all attributes and values in a format digestable by Ganglia
  def all
    self.class::ATTRS.inject(String.new) do |string, attr|
      string << "#{attr.capitalize}\t#{eval("@#{attr}")}\n"
    end
  end

  # Dynamically create custom getters for each attribute that displays in a format digestable by Ganglia
  def create_getters
    self.class::ATTRS.each do |method_name|
      self.class.class_eval do
        define_method(method_name) do
          "#{method_name.capitalize}\t#{eval("@#{method_name}")}"
        end
      end
    end
  end

  private

  def get_webpage
    response = RestClient.get(self.endpoint_uri)
    @parsed_response = Nokogiri::HTML.parse(response.body)
  end
end
