class Api::V1::Items::MostRevenueController < ApplicationController
  def index
    @items = Item.revenue_ranking(params["quantity"])
    render json: ItemsSerializer.new(@items)
  end
end
