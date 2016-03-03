# class Bot
#   include Behavior
#   include Hook (channel_joined)
#
#   command 'hello' do
#   end
#
#   match // do
#   end
# end
# factory.hears(/regex/, :direct_message, :direct_mention, :mention) do |bot, message|
#   do something with the bot
# end
# factory.on(:channel_joined) do |bot, message|
# end

require_relative "gotcha-bot/bot"
require_relative "gotcha-bot/configuration"
require_relative "gotcha-bot/factory"

module GotchaBot
  class << self
    def configure
      yield configuration if block_given?
    end

    def configuration
      @configuration ||= Configuration.new
    end
  end
end
