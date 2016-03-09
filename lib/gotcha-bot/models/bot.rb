module GotchaBot
  module Models
    class Bot < ActiveRecord::Base
      belongs_to :team
    end
  end
end
