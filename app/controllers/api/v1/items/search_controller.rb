class Api::V1::Items::SearchController < ApplicationController
  def show
    render json: ItemsSerializer.new(Item.search(params))
  end

  def index
    render json: ItemsSerializer.new(Item.search_all(params))
  end
end
