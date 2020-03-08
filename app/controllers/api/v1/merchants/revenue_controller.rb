class Api::V1::Merchants::RevenueController < ApplicationController
  def index
    render json: Merchant.revenue_by(params["date"])
  end
end
