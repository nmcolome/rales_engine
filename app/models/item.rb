class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  
  def self.search(params)
    if params["id"]
      Item.find(params["id"])
    elsif params["name"]
      Item.find_by(name: params["name"])
    elsif params["description"]
      desc = params["description"].split(". ").map{ |e| e.capitalize }.join(". ")
      Item.find_by(description: desc)
    elsif params["unit_price"]
      price = params["unit_price"].gsub(".","").to_i
      Item.find_by(unit_price: price)
    elsif params["created_at"]
      Item.find_by(created_at: params["created_at"])
    elsif params["updated_at"]
      Item.find_by(updated_at: params["updated_at"])
    elsif params["merchant_id"]
      Item.find_by(merchant_id: params["merchant_id"])
    end
  end

  def self.search_all(params)
    if params["id"]
      Item.where(id: params["id"])
    elsif params["name"]
      Item.where(name: params["name"])
    elsif params["description"]
      desc = params["description"].split(". ").map{ |e| e.capitalize }.join(". ")
      Item.where(description: desc)
    elsif params["unit_price"]
      price = params["unit_price"].gsub(".","").to_i
      Item.where(unit_price: price)
    elsif params["created_at"]
      Item.where(created_at: params["created_at"])
    elsif params["updated_at"]
      Item.where(updated_at: params["updated_at"])
    elsif params["merchant_id"]
      Item.where(merchant_id: params["merchant_id"])
    end
  end

  def self.revenue_ranking(quantity)
    Item.joins(invoice_items: [invoice: :transactions])
        .merge(Transaction.success)
        .group(:id)
        .order("sum(quantity * invoice_items.unit_price) DESC")
        .limit(quantity)
  end
end
