class Api::V1::Items::RandomController < ApplicationController
  def show
    render json: ItemsSerializer.new(Item.all.shuffle[1])
  end
end