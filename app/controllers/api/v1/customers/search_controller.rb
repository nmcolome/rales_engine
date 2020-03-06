class Api::V1::Customers::SearchController < ApplicationController
  def show
    if params["id"]
      @customer = Customer.find(params["id"])
    elsif params["first_name"]
      @customer = Customer.find_by(first_name: params["first_name"])
    elsif params["last_name"]
      @customer = Customer.find_by(last_name: params["last_name"])
    end

    render json: CustomersSerializer.new(@customer)
  end
end