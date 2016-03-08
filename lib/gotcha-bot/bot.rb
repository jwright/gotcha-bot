require "slack-ruby-client"

module GotchaBot
  class Bot
    attr_reader :token

    def initialize(token)
      @token = token
      @client = nil
    end

    def start!
      @stopping = false
      client.start!
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
        client
      end
    end
  end
end
