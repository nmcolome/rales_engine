class Invoice < ApplicationRecord
  belongs_to :customer
  belongs_to :merchant
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items

  enum status: [:shipped, :pending, :canceled]

  def self.search(params)
    if params["id"]
      Invoice.find(params["id"])
    elsif params["status"]
      Invoice.find_by(status: params["status"].downcase)
    elsif params["created_at"]
      Invoice.find_by(created_at: params["created_at"])
    elsif params["updated_at"]
      Invoice.find_by(updated_at: params["updated_at"])
    elsif params["merchant_id"]
      Invoice.find_by(merchant_id: params["merchant_id"])
    elsif params["customer_id"]
      Invoice.find_by(customer_id: params["customer_id"])
    end
  end

  def self.search_all(params)
    if params["id"]
      Invoice.where(id: params["id"])
    elsif params["status"]
      Invoice.where(status: params["status"].downcase)
    elsif params["created_at"]
      Invoice.where(created_at: params["created_at"])
    elsif params["updated_at"]
      Invoice.where(updated_at: params["updated_at"])
    end
  end
end
