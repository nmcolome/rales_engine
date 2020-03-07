class Api::V1::Items::SearchController < ApplicationController
  def show
    render json: ItemsSerializer.new(find_item)
  end

  def find_item
    if params["id"]
      Item.find(params["id"])
    elsif params["name"]
      Item.find_by(name: params["name"].capitalize)
    elsif params["description"]
      params["description"] = params["description"].split(". ").map{ |e| e.capitalize }.join(". ")
      Item.find_by(description: params["description"])
    elsif params["unit_price"]
      Item.find_by(unit_price: params["unit_price"])
    elsif params["created_at"]
      Item.find_by(created_at: params["created_at"])
    elsif params["updated_at"]
      Item.find_by(updated_at: params["updated_at"])
    end
  end
end
