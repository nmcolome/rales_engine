class Api::V1::Items::DaysController < ApplicationController
  def show
    render json: DaysSerializer.new(Item.best_day(params["item_id"]))
  end
end
