FactoryBot.define do
  factory :invoice_item do
    item
    invoice
    quantity { 5 }
    unit_price { 13635 }
  end
end
