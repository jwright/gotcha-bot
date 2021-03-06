require_relative "gotcha-bot/version"
require_relative "gotcha-bot/core_ext"
require_relative "gotcha-bot/loggable"
require_relative "gotcha-bot/hooks"
require_relative "gotcha-bot/bot"
require_relative "gotcha-bot/configuration"
require_relative "gotcha-bot/factory"
require_relative "gotcha-bot/models"

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
