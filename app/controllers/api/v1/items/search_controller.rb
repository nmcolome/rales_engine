class Api::V1::Items::SearchController < ApplicationController
  def show
    if params["id"]
      @item = Item.find(params["id"])
    elsif params["name"]
      @item = Item.find_by(name: params["name"])
    elsif params["description"]
      @item = Item.find_by(description: params["description"])
    elsif params["unit_price"]
      @item = Item.find_by(unit_price: params["unit_price"])
    elsif params["created_at"]
      @item = Item.find_by(created_at: params["created_at"])
    elsif params["updated_at"]
      @item = Item.find_by(updated_at: params["updated_at"])
    end

    render json: ItemsSerializer.new(@item)
  end
end
