class ItemsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :description, :unit_price, :merchant_id

  attribute :unit_price do |object|
    (object.unit_price/100.00).to_s
  end
end
