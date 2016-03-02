RSpec.describe GotchaBot do
  describe ".configure" do
    it "yields an instance of configuration" do
      expect { |b| described_class.configure &b }.to \
        yield_with_args(GotchaBot::Configuration)
    end
  end
end
