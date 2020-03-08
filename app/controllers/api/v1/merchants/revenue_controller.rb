class Api::V1::Merchants::RevenueController < ApplicationController
  def index
    render json: RevenuesSerializer.new(Merchant.revenue_by(params["date"]))
  end
end
