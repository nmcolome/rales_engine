require "rails_helper"

RSpec.describe "Items find endpoints" do
  before :each do
    @item = create(:item, created_at: "2012-03-27 14:53:59 UTC", updated_at: "2012-03-27 14:53:59 UTC")
  end

  describe "returns a single item based on any its attributes" do
    it "finds based on id" do
      id = @item.id

      get "/api/v1/items/find?id=#{id}"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      item = raw["data"]

      expect(item["id"].to_i).to eq(id)
    end

    it "finds based on name" do
      name = @item.name

      get "/api/v1/items/find?name=#{name}"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      item = raw["data"]

      expect(item["attributes"]["name"]).to eq(name)
    end

    it "finds based on description" do
      description = @item.description

      get "/api/v1/items/find?description=#{description}"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      item = raw["data"]

      expect(item["attributes"]["description"]).to eq(description)
    end

    it "finds based on unit_price" do
      unit_price = @item.unit_price

      get "/api/v1/items/find?unit_price=#{unit_price}"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      item = raw["data"]

      expect(item["attributes"]["unit_price"]).to eq(unit_price)
    end

    it "finds based on created_at" do
      get "/api/v1/items/find?created_at=2012-03-27 14:53:59 UTC"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      item = raw["data"]

      expect(item["id"].to_i).to eq(@item.id)
    end

    it "finds based on updated_at" do
      get "/api/v1/items/find?updated_at=2012-03-27 14:53:59 UTC"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      item = raw["data"]

      expect(item["id"].to_i).to eq(@item.id)
    end
  end
end
