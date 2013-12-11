require 'rest-client'
require 'nokogiri'
require 'pry'

module Scrapable
  def self.included(base)
    base.class_eval do
      class << self
        attr_accessor :scrape_list, :endpoint_uri
      end

      def self.scrapes_for(*attributes, options)
        self.scrape_list = attributes
        self.endpoint_uri = options[:from]
        self.scrape_all
      end

      def self.scrape_all
        response = fetch(self.endpoint_uri)

        self.scrape_list.inject(String.new) do |result, attr|
          send("#{attr} = ", scrape_attribute(attr, response))
          result << "#{attr.capitalize}\t#{send(attr)}\n"
        end
      end

      def self.fetch(url)
        begin
          response = RestClient.get(url)
          @parsed_response = Nokogiri::HTML.parse(response.body)
        rescue ArgumentError
          raise 'You forgot to set the hostname to your Liebert unit. More information can be found here: https://github.com/bswinnerton/liebert/blob/master/README.md'
        rescue URI::InvalidURIError
          raise  'You\'ve set an invalid hostname in your environemnt variable'
        rescue SocketError
          raise "Unable to contact liebert unit at #{self.endpoint_uri}"
        end
      end
    end
  end
end
