require "rails_helper"

RSpec.describe "Items find endpoints" do
  before :each do
    @item = create(:item, created_at: "2012-03-27 14:53:59 UTC", updated_at: "2012-03-27 14:53:59 UTC")
  end

  describe "returns a single item based on any its attributes" do
    it "finds based on id" do
      get "/api/v1/items/find?id=#{@item.id}"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      item = raw["data"]

      expect(item["id"].to_i).to eq(@item.id)
    end

    it "finds based on name" do
      get "/api/v1/items/find?name=#{@item.name}"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      item = raw["data"]

      expect(item["attributes"]["name"]).to eq(@item.name)
    end

    it "finds based on description" do
      get "/api/v1/items/find?description=#{@item.description}"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      item = raw["data"]

      expect(item["attributes"]["description"]).to eq(@item.description)
    end

    it "finds based on unit_price" do
      get "/api/v1/items/find?unit_price=#{@item.unit_price}"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      item = raw["data"]

      expect(item["attributes"]["unit_price"]).to eq((@item.unit_price/100.00).to_s)
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

    it "finds based on merchant_id" do
      get "/api/v1/items/find?merchant_id=#{@item.merchant_id}"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      item = raw["data"]

      expect(item["id"]).to eq(@item.id.to_s)
      expect(item["attributes"]["merchant_id"].to_i).to eq(@item.merchant_id)
    end
  end
end
