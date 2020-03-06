class Api::V1::TransactionsController < ApplicationController
  def index
    render json: TransactionsSerializer.new(Transaction.all)
  end

  def show
    render json: TransactionsSerializer.new(Transaction.find(params[:id]))
  end
end
