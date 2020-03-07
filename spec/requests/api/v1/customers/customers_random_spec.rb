require "rails_helper"

RSpec.describe "Customer random endpoint" do
  it "returns a random resource" do
    create_list(:customer, 10)
    customers = []

    get "/api/v1/customers/random"

    expect(response).to be_successful

    raw = JSON.parse(response.body)
    customers << raw["data"]

    expect(raw.count).to eq(1)

    get "/api/v1/customers/random"
    customers << JSON.parse(response.body)["data"]

    get "/api/v1/customers/random"
    customers << JSON.parse(response.body)["data"]

    get "/api/v1/customers/random"
    customers << JSON.parse(response.body)["data"]

    expect(customers.pluck("id").uniq.count).to be > 1
  end
end
