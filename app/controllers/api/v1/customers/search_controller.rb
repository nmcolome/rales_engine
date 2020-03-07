class Api::V1::Customers::SearchController < ApplicationController
  def show
    render json: CustomersSerializer.new(find_customer)
  end

  def find_customer
    if params["id"]
      Customer.find(params["id"])
    elsif params["first_name"]
      Customer.find_by(first_name: params["first_name"].capitalize)
    elsif params["last_name"]
      Customer.find_by(last_name: params["last_name"].capitalize)
    elsif params["created_at"]
      Customer.find_by(created_at: params["created_at"])
    elsif params["updated_at"]
      Customer.find_by(updated_at: params["updated_at"])
    end
  end
end
