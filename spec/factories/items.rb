FactoryBot.define do
  factory :item do
    name { "Flute" }
    description { "Create beautiful music with a flute." }
    unit_price { 75107 }
    merchant
  end
end
