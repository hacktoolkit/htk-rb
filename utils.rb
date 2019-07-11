module Htk
  class Base
    def slack_debug(text)
      conn = ::Htk::Apis::SlackDebug.connection
      response = conn.post('') do |req|
        req.headers['Accept'] = 'application/json'
        req.headers['Content-Type'] = 'application/json'

        req.body = {
          'text' => text,
        }.to_json
      end
    end
  end

  Utils = Base.new
end
