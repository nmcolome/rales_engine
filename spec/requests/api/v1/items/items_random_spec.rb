require "rails_helper"

RSpec.describe "Item random endpoint" do
  it "returns a random resource" do
    create_list(:item, 10)
    items = []

    get "/api/v1/items/random"

    expect(response).to be_successful

    raw = JSON.parse(response.body)
    items << raw["data"]

    expect(raw.count).to eq(1)

    get "/api/v1/items/random"
    items << JSON.parse(response.body)["data"]

    get "/api/v1/items/random"
    items << JSON.parse(response.body)["data"]

    get "/api/v1/items/random"
    items << JSON.parse(response.body)["data"]

    expect(items.pluck("id").uniq.count).to be > 1
  end
end
