class Api::V1::Transactions::SearchController < ApplicationController
  def show
    @transaction =
      if params["id"]
        Transaction.find(params["id"])
      elsif params["credit_card_number"]
        Transaction.find_by(credit_card_number: params["credit_card_number"])
      elsif params["credit_card_expiration_date"]
        Transaction.find_by(credit_card_expiration_date: params["credit_card_expiration_date"])
      elsif params["result"]
        Transaction.find_by(result: params["result"])
      elsif params["created_at"]
        Transaction.find_by(created_at: params["created_at"])
      elsif params["updated_at"]
        Transaction.find_by(updated_at: params["updated_at"])
      end

    render json: TransactionsSerializer.new(@transaction)
  end
end
