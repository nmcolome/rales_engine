class Api::V1::Merchants::RandomController < ApplicationController
  def show
    render json: MerchantsSerializer.new(Merchant.all.shuffle[1])
  end
end