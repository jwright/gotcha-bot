module GotchaBot
  module Loggable
    def self.included(base)
      base.send :extend, ClassMethods
    end

    module ClassMethods
      def logger
        @logger ||= begin
          $stdout.sync = true
          Logger.new(STDOUT)
        end
      end
    end

    private

    def logger
      self.class.logger
    end
  end
end
