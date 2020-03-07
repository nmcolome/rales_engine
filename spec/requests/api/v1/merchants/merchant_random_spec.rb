require "rails_helper"

RSpec.describe "Merchant random endpoint" do
  it "returns a random resource" do
    create_list(:merchant, 10)
    merchants = []

    get "/api/v1/merchants/random"

    expect(response).to be_successful

    raw = JSON.parse(response.body)
    merchants << raw["data"]

    expect(raw.count).to eq(1)

    get "/api/v1/merchants/random"
    merchants << JSON.parse(response.body)["data"]

    get "/api/v1/merchants/random"
    merchants << JSON.parse(response.body)["data"]

    get "/api/v1/merchants/random"
    merchants << JSON.parse(response.body)["data"]

    expect(merchants.pluck("id").uniq.count).to be > 1
  end
end
