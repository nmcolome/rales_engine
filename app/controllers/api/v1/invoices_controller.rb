class Api::V1::InvoicesController < ApplicationController
  def index
    render json: InvoicesSerializer.new(Invoice.all)
  end
end