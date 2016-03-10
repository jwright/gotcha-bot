FactoryGirl.define do
  factory :bot, class: GotchaBot::Models::Bot do
    access_token "xoxb-ACCESS_TOKEN"
    bot_id "UBOT"
    name "gotcha"
  end
end
