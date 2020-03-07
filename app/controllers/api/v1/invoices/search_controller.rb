class Api::V1::Invoices::SearchController < ApplicationController
  def show
    render json: InvoicesSerializer.new(Invoice.search(params))
  end

  def index
    render json: InvoicesSerializer.new(Invoice.search_all(params))
  end
end
