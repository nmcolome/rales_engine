class Api::V1::Transactions::SearchController < ApplicationController
  def show
    render json: TransactionsSerializer.new(Transaction.search(params))
  end

  def index
    render json: TransactionsSerializer.new(Transaction.search_all(params))
  end
end
