class InvoicesSerializer
  include FastJsonapi::ObjectSerializer
  # has_many :transactions
  # has_many :invoice_items
  # has_many :items, through: :invoice_items
  attributes :status, :customer_id, :merchant_id
end
