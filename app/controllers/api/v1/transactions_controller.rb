class Api::V1::TransactionsController < ApplicationController
  def index
    render json: TransactionsSerializer.new(Transaction.all)
  end
end