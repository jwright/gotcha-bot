RSpec.describe GotchaBot::Bot do
  let(:token) { "TOKEN" }
  subject { described_class.new(token) }

  describe "#start!" do
    it "starts the communiction with Slack" do
      expect_any_instance_of(Slack::RealTime::Client).to \
        receive(:start!)
      subject.start!
    end
  end

  describe "#restart!" do
    it "restarts the communication with Slack" do
      expect(subject).to receive(:start!)
      subject.restart!
    end

    context "when it encounters an error" do
      it "waits the specified number of seconds" do
        call_count = 0
        allow(subject).to receive(:start!) do
          call_count += 1
          call_count.odd? ? raise("Boom!") : nil
        end
        expect(subject).to receive(:sleep).with 0.1
        subject.restart! 0.1
      end
    end
  end
end
