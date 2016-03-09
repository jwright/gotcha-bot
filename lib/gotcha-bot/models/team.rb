module GotchaBot
  module Models
    class Team < ActiveRecord::Base
      scope :active, -> { where(status: nil) }
    end
  end
end
