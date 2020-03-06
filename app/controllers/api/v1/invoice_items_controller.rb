class Api::V1::InvoiceItemsController < ApplicationController
  def index
    render json: InvoiceItemsSerializer.new(InvoiceItem.all)
  end
end