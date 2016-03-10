require "active_record_spec_helper"

RSpec.describe GotchaBot::Models::Team do
  describe ".active" do
    let!(:active_team) { create :team, :active }
    let!(:inactive_team) { create :team, :inactive }

    it "returns all active teams" do
      expect(described_class.active).to eq [active_team]
    end
  end

  describe ".for_team_id" do
    let(:team_id) { "TBLAH" }
    let!(:team) { create :team, team_id: team_id }

    it "returns the team with the team id" do
      expect(described_class.for_team_id(team_id)).to eq team
    end

    it "returns nil if the team was not found" do
      expect(described_class.for_team_id("blah")).to be_nil
    end
  end
end
