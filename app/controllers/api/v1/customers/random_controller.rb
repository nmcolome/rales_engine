class Api::V1::Customers::RandomController < ApplicationController
  def show
    render json: CustomersSerializer.new(Customer.all.shuffle[0])
  end
end