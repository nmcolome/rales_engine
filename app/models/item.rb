class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.search(params)
    if params["id"]
      Item.find(params["id"])
    elsif params["name"]
      Item.find_by(name: params["name"].capitalize)
    elsif params["description"]
      params["description"] = params["description"].split(". ").map{ |e| e.capitalize }.join(". ")
      Item.find_by(description: params["description"])
    elsif params["unit_price"]
      Item.find_by(unit_price: params["unit_price"])
    elsif params["created_at"]
      Item.find_by(created_at: params["created_at"])
    elsif params["updated_at"]
      Item.find_by(updated_at: params["updated_at"])
    end
  end

  def self.search_all(params)
    if params["id"]
      Item.where(id: params["id"])
    elsif params["name"]
      Item.where(name: params["name"].capitalize)
    elsif params["description"]
      params["description"] = params["description"].split(". ").map{ |e| e.capitalize }.join(". ")
      Item.where(description: params["description"])
    elsif params["unit_price"]
      Item.where(unit_price: params["unit_price"])
    elsif params["created_at"]
      Item.where(created_at: params["created_at"])
    elsif params["updated_at"]
      Item.where(updated_at: params["updated_at"])
    end
  end
end
