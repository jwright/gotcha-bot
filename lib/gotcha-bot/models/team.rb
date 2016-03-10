module GotchaBot
  module Models
    class Team < ActiveRecord::Base
      has_one :bot

      scope :active, -> { where(status: nil) }
    end
  end
end
