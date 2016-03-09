module GotchaBot
  module Hooks
    module Hello
      extend Base

      def hello(bot, data)
        logger.info "#{Time.now}: Connected to #{bot.token[0..8]} to Gotcha (#{data.inspect})"
      end
    end
  end
end
