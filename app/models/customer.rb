class Customer < ApplicationRecord
  has_many :invoices

  def self.search(params)
    if params["id"]
      Customer.find(params["id"])
    elsif params["first_name"]
      Customer.find_by(first_name: params["first_name"].capitalize)
    elsif params["last_name"]
      Customer.find_by(last_name: params["last_name"].capitalize)
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
      Customer.where(first_name: params["first_name"].capitalize)
    elsif params["last_name"]
      Customer.where(last_name: params["last_name"].capitalize)
    elsif params["created_at"]
      Customer.where(created_at: params["created_at"])
    elsif params["updated_at"]
      Customer.where(updated_at: params["updated_at"])
    end
  end
end
