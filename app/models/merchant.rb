class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices

  def self.search(params)
    if params["id"]
      Merchant.find(params["id"])
    elsif params["name"]
      Merchant.find_by(name: params["name"].titlecase)
    elsif params["created_at"]
      Merchant.find_by(created_at: params["created_at"])
    elsif params["updated_at"]
      Merchant.find_by(updated_at: params["updated_at"])
    end
  end

  def self.search_all(params)
    if params["id"]
      Merchant.where(id: params["id"])
    elsif params["name"]
      Merchant.where(name: params["name"].titlecase)
    elsif params["created_at"]
      Merchant.where(created_at: params["created_at"])
    elsif params["updated_at"]
      Merchant.where(updated_at: params["updated_at"])
    end
  end

  def self.revenue_ranking(quantity)
    Merchant.joins(invoices: [:invoice_items, :transactions])
            .group(:id, :result)
            .having("transactions.result = 0")
            .order("sum(quantity * unit_price) DESC")
            .limit(quantity)
  end

  def self.revenue_by(date)
    result = Merchant.select('sum(quantity * unit_price) AS revenue')
                     .joins(invoices: [:invoice_items, :transactions])
                     .merge(Transaction.success)
                     .where("date(invoices.created_at) = '#{date}'")[0]["revenue"]

    {"total_revenue" => result/100.00}
  end
end
