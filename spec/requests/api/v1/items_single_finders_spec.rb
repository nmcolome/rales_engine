require "rails_helper"

RSpec.describe "Items find endpoints" do
  describe "returns a single item based on any its attributes" do
    it "finds based on id" do
      id = create(:item).id

      get "/api/v1/items/find?id=#{id}"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      item = raw["data"]

      expect(item["id"].to_i).to eq(id)
    end

    it "finds based on name" do
      name = create(:item).name

      get "/api/v1/items/find?name=#{name}"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      item = raw["data"]

      expect(item["attributes"]["name"]).to eq(name)
    end

    it "finds based on description" do
      description = create(:item).description

      get "/api/v1/items/find?description=#{description}"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      item = raw["data"]

      expect(item["attributes"]["description"]).to eq(description)
    end

    it "finds based on unit_price" do
      unit_price = create(:item).unit_price

      get "/api/v1/items/find?unit_price=#{unit_price}"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      item = raw["data"]

      expect(item["attributes"]["unit_price"]).to eq(unit_price)
    end
  end
end
