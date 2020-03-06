require "rails_helper"

RSpec.describe "Customers endpoints" do
  it "returns all customers" do
    customers = create_list(:customer, 5)

    get "/api/v1/customers"

    expect(response).to be_successful

    raw = JSON.parse(response.body)
    customers = raw["data"]

    expect(customers.count).to eq(5)
  end
end
