class InvoiceItemsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :quantity, :unit_price, :item_id, :invoice_id

  attribute :unit_price do |object|
    (object.unit_price/100.00).to_s
  end
end
