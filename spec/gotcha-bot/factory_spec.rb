RSpec.describe GotchaBot::Factory do
  describe ".startup!" do
    it "sets the configuration for the factory" do
      described_class.startup!(slack_key: "KEY", slack_secret: "SECRET")
      expect(GotchaBot.configuration.slack_key).to eq "KEY"
      expect(GotchaBot.configuration.slack_secret).to eq "SECRET"
    end
  end
end
