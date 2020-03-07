class Api::V1::Customers::SearchController < ApplicationController
  def show
    render json: CustomersSerializer.new(Customer.search(params))
  end

  def index
    render json: CustomersSerializer.new(Customer.search_all(params))
  end
end
