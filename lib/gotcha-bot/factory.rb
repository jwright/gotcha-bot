module GotchaBot
  class Factory
    def self.startup!(configuration={})
      GotchaBot.configure { |config| config.copy configuration }
    end
  end
end
