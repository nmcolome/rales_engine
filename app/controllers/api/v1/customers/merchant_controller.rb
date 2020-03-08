class Api::V1::Customers::MerchantController < ApplicationController
  def show
    @merchant = Customer.top_merchant(params[:customer_id])
    render json: MerchantsSerializer.new(@merchant)
  end
end
