class Api::V1::InvoicesController < ApplicationController
  def index
    render json: InvoicesSerializer.new(Invoice.all)
  end

  def show
    render json: InvoicesSerializer.new(Invoice.find(params[:id]))
  end
end