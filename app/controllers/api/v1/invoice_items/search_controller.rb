class Api::V1::InvoiceItems::SearchController < ApplicationController
  def show
    render json: InvoiceItemsSerializer.new(find_invoice_item)
  end

  def find_invoice_item
    if params["id"]
      InvoiceItem.find(params["id"])
    elsif params["quantity"]
      InvoiceItem.find_by(quantity: params["quantity"])
    elsif params["unit_price"]
      InvoiceItem.find_by(unit_price: params["unit_price"])
    elsif params["created_at"]
      InvoiceItem.find_by(created_at: params["created_at"])
    elsif params["updated_at"]
      InvoiceItem.find_by(updated_at: params["updated_at"])
    end
  end
end
