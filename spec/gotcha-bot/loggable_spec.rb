RSpec.describe GotchaBot::Loggable do
  class Foo
    include GotchaBot::Loggable
  end

  describe ".logger" do
    it "is a logger" do
      expect(Foo.logger).to be_a_kind_of Logger
    end
  end
end
