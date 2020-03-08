class Api::V1::Merchants::CustomerController < ApplicationController
  def show
    @customer = Merchant.top_customer(params[:merchant_id])
    render json: CustomersSerializer.new(@customer)
  end
end
