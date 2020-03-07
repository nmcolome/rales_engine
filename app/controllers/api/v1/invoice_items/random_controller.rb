class Api::V1::InvoiceItems::RandomController < ApplicationController
  def show
    render json: InvoiceItemsSerializer.new(InvoiceItem.all.shuffle[0])
  end
end
