require "active_record_spec_helper"

RSpec.describe GotchaBot::Models::Team do
  describe ".active" do
    let!(:active_team) { create :team, :active }
    let!(:inactive_team) { create :team, :inactive }

    it "returns all active teams" do
      expect(described_class.active).to eq [active_team]
    end
  end
end
