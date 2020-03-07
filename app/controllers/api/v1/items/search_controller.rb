class Api::V1::Items::SearchController < ApplicationController
  def show
    @item =
      if params["id"]
        Item.find(params["id"])
      elsif params["name"]
        Item.find_by(name: params["name"])
      elsif params["description"]
        Item.find_by(description: params["description"])
      elsif params["unit_price"]
        Item.find_by(unit_price: params["unit_price"])
      elsif params["created_at"]
        Item.find_by(created_at: params["created_at"])
      elsif params["updated_at"]
        Item.find_by(updated_at: params["updated_at"])
      end

    render json: ItemsSerializer.new(@item)
  end
end
