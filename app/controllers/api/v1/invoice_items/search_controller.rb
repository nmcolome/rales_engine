class Api::V1::InvoiceItems::SearchController < ApplicationController
  def show
    render json: InvoiceItemsSerializer.new(InvoiceItem.search(params))
  end

  def index
    render json: InvoiceItemsSerializer.new(InvoiceItem.search_all(params))
  end
end
