class InvoiceItem < ApplicationRecord
  belongs_to :item
  belongs_to :invoice

  def self.search(params)
    if params["id"]
      InvoiceItem.find(params["id"])
    elsif params["quantity"]
      InvoiceItem.find_by(quantity: params["quantity"])
    elsif params["unit_price"]
      price = params["unit_price"].gsub(".","").to_i
      InvoiceItem.find_by(unit_price: price)
    elsif params["created_at"]
      InvoiceItem.find_by(created_at: params["created_at"])
    elsif params["updated_at"]
      InvoiceItem.find_by(updated_at: params["updated_at"])
    elsif params["invoice_id"]
      InvoiceItem.find_by(invoice_id: params["invoice_id"])
    elsif params["item_id"]
      InvoiceItem.find_by(item_id: params["item_id"])
    end
  end

  def self.search_all(params)
    if params["id"]
      InvoiceItem.where(id: params["id"])
    elsif params["quantity"]
      InvoiceItem.where(quantity: params["quantity"])
    elsif params["unit_price"]
      price = params["unit_price"].gsub(".","").to_i
      InvoiceItem.where(unit_price: price)
    elsif params["created_at"]
      InvoiceItem.where(created_at: params["created_at"])
    elsif params["updated_at"]
      InvoiceItem.where(updated_at: params["updated_at"])
    elsif params["invoice_id"]
      InvoiceItem.where(invoice_id: params["invoice_id"])
    elsif params["item_id"]
      InvoiceItem.where(item_id: params["item_id"])
    end
  end
end
