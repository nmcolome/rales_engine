require "rails_helper"

RSpec.describe "merchants endpoints" do
  it "returns all records" do
    merchants = create_list(:merchant, 5)

    get "/api/v1/merchants"

    expect(response).to be_successful

    items = JSON.parse(response.body)

    expect(items.count).to eq(5)
  end
end
