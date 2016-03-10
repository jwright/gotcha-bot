module GotchaBot
  module Models
    class Team < ActiveRecord::Base
      has_one :bot

      scope :active, -> { where(status: nil) }

      def self.for_team_id(team_id)
        where(team_id: team_id).first
      end
    end
  end
end
