FactoryBot.define do
  factory :item do
    name { "Flute" }
    description { "Create beautiful music with a flute. This is a description with 2 sentences." }
    unit_price { 75107 }
    merchant
  end
end
