class Api::V1::Transactions::RandomController < ApplicationController
  def show
    render json: TransactionsSerializer.new(Transaction.all.shuffle[0])
  end
end
