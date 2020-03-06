class InvoiceItemsSerializer
  include FastJsonapi::ObjectSerializer
  belongs_to :item
  belongs_to :invoice

  attributes :quantity, :unit_price
end
