require "rails_helper"

RSpec.describe "Items endpoints" do
  it "returns all items" do
    create_list(:item, 5)

    get "/api/v1/items"

    expect(response).to be_successful

    raw = JSON.parse(response.body)
    item = raw["data"]

    expect(item.count).to eq(5)
  end
end
