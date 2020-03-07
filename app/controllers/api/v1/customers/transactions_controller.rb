class Api::V1::Customers::TransactionsController < ApplicationController
  def index
    @transactions = Customer.transactions(params["customer_id"])
    render json: TransactionsSerializer.new(@transactions)
  end
end
