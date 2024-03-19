require_relative 'local_settings'

module Htk
  module Apis
    class Base
      attr_accessor :name, :url

      def initialize(name, url)
        @name = name
        @url = url
      end

      def connection(&block)
        Faraday.new(url) do |faraday|
          faraday.use ::Faraday::Request::Multipart
          faraday.use ::Faraday::Request::UrlEncoded
          faraday.adapter ::Faraday::Adapter::NetHttp

          block.call(faraday) if block_given?
        end
      end
    end

    SlackDebug = Base.new('slack_debug', SLACK_WEBHOOK_URL)
  end
end
