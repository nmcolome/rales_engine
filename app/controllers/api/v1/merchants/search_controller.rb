class Api::V1::Merchants::SearchController < ApplicationController
  def show
    render json: MerchantsSerializer.new(Merchant.search(params))
  end

  def index
    render json: MerchantsSerializer.new(Merchant.search_all(params))
  end
end
