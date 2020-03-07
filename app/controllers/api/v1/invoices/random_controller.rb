class Api::V1::Invoices::RandomController < ApplicationController
  def show
    render json: InvoicesSerializer.new(Invoice.all.shuffle[0])
  end
end
