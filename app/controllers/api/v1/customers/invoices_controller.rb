class Api::V1::Customers::InvoicesController < ApplicationController
  def index
    @invoices = Customer.find(params["customer_id"]).invoices
    render json: InvoicesSerializer.new(@invoices)
  end
end
