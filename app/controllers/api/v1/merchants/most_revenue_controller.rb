class Api::V1::Merchants::MostRevenueController < ApplicationController
  def index
    @merchants = Merchant.revenue_ranking(params["quantity"].to_i)
    render json: MerchantsSerializer.new(@merchants)
  end
end