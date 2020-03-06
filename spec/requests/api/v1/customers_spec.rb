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

  it "resturns a specific customer" do
    id = create(:customer).id

    get "/api/v1/customers/#{id}"

    expect(response).to be_successful

    raw = JSON.parse(response.body)
    customer = raw["data"]

    expect(customer["id"].to_i).to eq(id)
    expect(customer.keys).to eq(["id", "type", "attributes"])
    expect(customer["type"]).to eq("customers")
    expect(customer["attributes"].keys).to eq(["first_name", "last_name"])
  end
end
