class InvoicesSerializer
  include FastJsonapi::ObjectSerializer
  belongs_to :customer
  belongs_to :merchant
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items

  attributes :status
end
