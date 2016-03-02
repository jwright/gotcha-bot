module GotchaBot
  class Configuration
    attr_accessor :slack_key, :slack_secret

    def copy(configuration={})
      configuration.keys.each do |key|
        method = "#{key}="
        if self.respond_to? method
          self.send method, configuration.fetch(key)
        end
      end
    end
  end
end
