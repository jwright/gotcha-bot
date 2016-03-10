require "eventmachine"

module GotchaBot
  class AlreadyStartedError < StandardError; end

  class Factory
    include Loggable

    LOCK = Mutex.new
    @bots = Hash.new

    class << self
      def bots
        @bots
      end

      def startup!(configuration={})
        raise AlreadyStartedError if running?

        GotchaBot.configure { |config| config.copy configuration }
        instance
        begin; end until running?
      end

      def shutdown!
        EM.next_tick { bots.each { |_token, bot| bot.stop! } }
        EM.add_shutdown_hook { @instance = nil }
        EM.stop
        begin; end until !running?
        LOCK.synchronize { bots.clear }
      end

      def running?
        EM.reactor_running?
      end

      def instance
        @instance ||= new
      end

      def build(token)
        fail "Bot already started for #{token[0..8]}" if bots.key?(token)

        bot = Bot.new(token)
        LOCK.synchronize { bots[token] = bot }
        bot
      end
    end

    private

    def initialize
      start!
    end

    def start!
      factory_thread = Thread.new do
        EM.run do
          Thread.pass until EM.reactor_running?
          EM.next_tick do
            teams.each { |team| self.class.build(team.bot.access_token).start! }
          end
        end
      end
      factory_thread.abort_on_exception = true
    end

    def teams
      Models::Team.active
    end
  end
end
