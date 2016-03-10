require "slack-ruby-client"

module GotchaBot
  class Bot
    include Loggable
    include Hooks::Hello

    attr_reader :token

    def initialize(token)
      @token = token
      @client = nil
    end

    def start!
      handle_exceptions do
        @stopping = false
        client.start!
      end
    end

    def started?
      !@client.nil?
    end

    def stop!
      @stopping = true
      client.stop! if started?
    end

    def restart!(wait=1)
      start!
    rescue StandardError => e
      sleep wait
      logger.error "#{e.message}, reconnecting in #{wait} second(s)."
      logger.debug e
      restart! [wait * 2, 60].min
    end

    private

    def client
      @client ||= begin
        client = Slack::RealTime::Client.new(token: token)
        client.on :close do |_|
          @client = nil
          restart! unless @stopping
        end
        hook_it_up(client)
        client
      end
    end

    def handle_exceptions
      yield
    rescue Slack::Web::Api::Error => e
      logger.error e
      handle_migration_in_process
    rescue Faraday::Error::TimeoutError, Faraday::Error::ConnectionFailed,
      Faraday::Error::SSLError => e
      logger.error e
      sleep 1 # ignore, try again
    rescue StandardError => e
      logger.error e
      raise e
    end

    def handle_migration_in_process(e)
      case e.message
      when 'migration_in_progress'
        sleep 1 # ignore, try again
      else
        raise e
      end
    end

    def hook_it_up(client)
      hooks.each do |hook|
        client.on hook do |data|
          begin
            send hook, client, data
          rescue StandardError => e
            logger.error e
          end
        end
      end
    end
  end
end
