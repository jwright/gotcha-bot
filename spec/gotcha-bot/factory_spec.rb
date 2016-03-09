RSpec.describe GotchaBot::Factory do
  before { allow(GotchaBot::Models::Team).to receive(:active).and_return [] }

  describe ".startup!" do
    after { described_class.shutdown! }

    it "sets the configuration for the factory" do
      described_class.startup!(slack_key: "KEY", slack_secret: "SECRET")
      expect(GotchaBot.configuration.slack_key).to eq "KEY"
      expect(GotchaBot.configuration.slack_secret).to eq "SECRET"
    end

    it "does not allow multiple factories to be started" do
      described_class.startup!
      expect { described_class.startup! }.to \
        raise_error GotchaBot::AlreadyStartedError
    end

    it "starts the event loop to spawn existing bots" do
      team = double(:team, bot: double(:team_bot, access_token: "xoxb-ACCESS_TOKEN"))
      bot = double(:bot, start!: nil)
      allow(GotchaBot::Models::Team).to receive(:active).and_return [team]
      expect(described_class).to \
        receive(:build).with("xoxb-ACCESS_TOKEN").and_return bot
      described_class.startup!
    end
  end

  describe ".shutdown!" do
    before { described_class.startup! }

    it "stops the event loop" do
      described_class.shutdown!
      expect(EM).to_not be_reactor_running
    end

    it "kills the instance" do
      described_class.shutdown!
      expect(described_class.instance_variable_get("@instance")).to be_nil
    end

    it "shutsdown all existing bots" do
      bot = double(:bot)
      allow(described_class).to \
        receive(:bots).and_return({ "xoxp-ACCESS_TOKEN" => bot })
      expect(bot).to receive(:stop!)
      described_class.shutdown!
    end
  end

  describe ".build" do
    before { described_class.startup! }
    after { described_class.shutdown! }

    it "creates an instance of the bot" do
      bot = described_class.build("TOKEN")
      expect(bot).to_not be_nil
    end
  end
end
