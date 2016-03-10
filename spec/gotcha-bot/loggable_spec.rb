RSpec.describe GotchaBot::Loggable do
  let(:dummy_class) { Class.new { include GotchaBot::Loggable }}

  describe ".logger" do
    it "is a logger" do
      expect(dummy_class.logger).to be_a_kind_of Logger
    end
  end
end
