require "eventmachine"

module GotchaBot
  class AlreadyStartedError < StandardError; end

  class Factory
    def self.startup!(configuration={})
      raise AlreadyStartedError if running?

      GotchaBot.configure { |config| config.copy configuration }
      instance
    end

    def self.shutdown!
      EM.add_shutdown_hook { @instance = nil }
      EM.stop
      begin; end until !running?
    end

    def self.instance
      @instance ||= new
    end

    def self.running?
      EM.reactor_running?
    end

    private

    def initialize
      start!
    end

    def start!
      factory_thread = Thread.new do
        EM.run do
          # TODO: Start all the teams in the database
        end
      end
      factory_thread.abort_on_exception = true
    end
  end
end
