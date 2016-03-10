FactoryGirl.define do
  factory :team, class: GotchaBot::Models::Team do
    access_token "xoxp-ACCESS_TOKEN"
    domain "sample"
    team_id "TSAMPLE"
    association :bot

    trait :active do
      status nil
    end

    trait :inactive do
      status "inactive"
    end
  end
end
