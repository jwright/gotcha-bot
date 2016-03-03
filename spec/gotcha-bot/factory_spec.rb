RSpec.describe GotchaBot::Factory do
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

    xit "starts the event loop to spawn existing bots"
  end

  describe ".shutdown!" do
    before do
      described_class.startup!
      described_class.shutdown!
    end

    it "stops the event loop" do
      expect(EM).to_not be_reactor_running
    end

    it "kills the instance" do
      expect(described_class.instance_variable_get("@instance")).to be_nil
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
