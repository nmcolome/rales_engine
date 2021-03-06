class Customer < ApplicationRecord
  has_many :invoices

  def self.search(params)
    if params["id"]
      Customer.find(params["id"])
    elsif params["first_name"]
      Customer.find_by(first_name: params["first_name"])
    elsif params["last_name"]
      Customer.find_by(last_name: params["last_name"])
    elsif params["created_at"]
      Customer.find_by(created_at: params["created_at"])
    elsif params["updated_at"]
      Customer.find_by(updated_at: params["updated_at"])
    end
  end

  def self.search_all(params)
    if params["id"]
      Customer.where(id: params["id"])
    elsif params["first_name"]
      Customer.where(first_name: params["first_name"])
    elsif params["last_name"]
      Customer.where(last_name: params["last_name"])
    elsif params["created_at"]
      Customer.where(created_at: params["created_at"])
    elsif params["updated_at"]
      Customer.where(updated_at: params["updated_at"])
    end
  end

  def self.transactions(id)
    Transaction.joins(:invoice).where(invoices: {customer_id: id})
  end

  def self.top_merchant(id)
    Customer.select('merchants.*')
            .joins(invoices: [:merchant, :transactions])
            .merge(Transaction.success)
            .where(id: id)
            .group("merchants.id")
            .order("COUNT(invoices.id) DESC")
            .first
  end
end
