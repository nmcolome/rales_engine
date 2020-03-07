class Api::V1::Transactions::InvoiceController < ApplicationController
  def show
    @invoice = Transaction.find(params["transaction_id"]).invoice
    render json: InvoicesSerializer.new(@invoice)
  end
end