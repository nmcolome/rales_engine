class Api::V1::Invoices::SearchController < ApplicationController
  def show
    render json: InvoicesSerializer.new(find_invoice)
  end

  def find_invoice
    if params["id"]
      Invoice.find(params["id"])
    elsif params["status"]
      Invoice.find_by(status: params["status"])
    elsif params["created_at"]
      Invoice.find_by(created_at: params["created_at"])
    elsif params["updated_at"]
      Invoice.find_by(updated_at: params["updated_at"])
    end
  end
end
