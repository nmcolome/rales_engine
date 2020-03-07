class Api::V1::Merchants::SearchController < ApplicationController
  def show
    @merchant =
      if params["id"]
        Merchant.find(params["id"])
      elsif params["name"]
        Merchant.find_by(name: params["name"])
      elsif params["created_at"]
        Merchant.find_by(created_at: params["created_at"])
      elsif params["updated_at"]
        Merchant.find_by(updated_at: params["updated_at"])
      end

    render json: MerchantsSerializer.new(@merchant)
  end
end
