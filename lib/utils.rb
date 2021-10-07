require 'singleton'
require 'date'
require 'fileutils'
require 'json'

DEFAULT_FILE_PATH = './tmp/fdebug.log'

module Htk
  class FDebugCounter
    include Singleton
    
    def initialize()
      @counter = 0
    end

    def increment
      @counter += 1
    end

    def count
      @counter
    end
  end

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

    ##
    # Dumps the given text to the given file. If file name omited, default path is './tmp/fdebug.log'

    def fdebug(text, file_path=DEFAULT_FILE_PATH)
      counter = ::Htk::FDebugCounter.instance
      counter.increment

      now = ::DateTime.now
      now_str = now.strftime('%Y-%m-%d %H:%I:%S')

      dirname = File.dirname(file_path)
      unless File.directory?(dirname)
        FileUtils.mkdir_p(dirname)
      end

      open(file_path, 'a') { |f|
        f << ">>>>>>>>>> FDEBUG #{counter.count} #{now_str} <<<<<<<<<<\n"
        f << text + "\n"
        f << ">>>>>>>>>> FDEBUG #{counter.count} #{now_str} <<<<<<<<<<\n"
      }

    end

    ##
    # Dumps given object to given file as JSON. If file name omited, default path is './tmp/fdebug.log'
    
    def fdebug_json(obj, file_path=DEFAULT_FILE_PATH)
      data = obj.to_json
      fdebug(JSON.pretty_generate(data), file_path)
    end
  end

  Utils = Base.new
end
