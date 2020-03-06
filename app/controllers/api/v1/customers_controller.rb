class Api::V1::CustomersController < ApplicationController
  def index
    render json: CustomersSerializer.new(Customer.all)
  end

  def show
    render json: CustomersSerializer.new(Customer.find(params[:id]))
  end
end
