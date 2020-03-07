class Api::V1::Invoices::CustomerController < ApplicationController
  def show
    render json: CustomersSerializer.new(Invoice.find(params["invoice_id"]).customer)
  end
end
