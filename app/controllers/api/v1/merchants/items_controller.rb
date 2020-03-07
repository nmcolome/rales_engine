class Api::V1::Merchants::ItemsController < ApplicationController
  def index
    render json: ItemsSerializer.new(Merchant.find(params["merchant_id"]).items)
  end
end
