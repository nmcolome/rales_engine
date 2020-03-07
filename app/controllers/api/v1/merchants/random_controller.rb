class Api::V1::Merchants::RandomController < ApplicationController
  def show
    render json: MerchantsSerializer.new(Merchant.all.shuffle[0])
  end
end
