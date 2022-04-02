FactoryBot.define do
  factory :resevation do
    user { nil }
    book { nil }
    start_date { "2022-03-30" }
    return_date { "2022-03-30" }
  end
end
