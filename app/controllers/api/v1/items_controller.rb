class Api::V1::ItemsController < ApplicationController
  def index
    render json: ItemsSerializer.new(Item.all)
  end
end