require "rails_helper"

RSpec.describe "Items find_all endpoints" do
  before :each do
    @list = create_list(:item, 5, created_at: "2012-03-27 14:53:59 UTC", updated_at: "2012-03-27 14:53:59 UTC")
    @item = @list[0]
  end

  describe "returns all items that match the query" do
    it "finds based on id" do
      get "/api/v1/items/find_all?id=#{@item.id}"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      items = raw["data"]

      expect(items.count).to eq(1)
      expect(items[0]["id"].to_i).to eq(@item.id)
    end

    it "finds based on name" do
      get "/api/v1/items/find_all?name=#{@item.name}"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      items = raw["data"]

      expect(items.count).to eq(5)
      expect(items[0]["attributes"]["name"]).to eq(@item.name)
      expect(items[-1]["attributes"]["name"]).to eq(@item.name)
    end

    it "finds based on description" do
      get "/api/v1/items/find_all?description=#{@item.description}"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      items = raw["data"]

      expect(items.count).to eq(5)
      expect(items[0]["attributes"]["description"]).to eq(@item.description)
      expect(items[-1]["attributes"]["description"]).to eq(@item.description)
    end

    it "finds based on unit_price" do
      get "/api/v1/items/find_all?unit_price=#{(@item.unit_price/100.00).to_s}"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      items = raw["data"]

      expect(items.count).to eq(5)
      expect(items[0]["attributes"]["unit_price"]).to eq((@item.unit_price/100.00).to_s)
      expect(items[-1]["attributes"]["unit_price"]).to eq((@item.unit_price/100.00).to_s)
    end

    it "finds based on created_at" do
      get "/api/v1/items/find_all?created_at=2012-03-27 14:53:59 UTC"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      items = raw["data"]

      expect(items.count).to eq(5)
      expect(items[0]["id"].to_i).to eq(@item.id)
    end

    it "finds based on updated_at" do
      get "/api/v1/items/find_all?updated_at=2012-03-27 14:53:59 UTC"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      items = raw["data"]

      expect(items.count).to eq(5)
      expect(items[0]["id"].to_i).to eq(@item.id)
    end

    it "finds based on merchant_id" do
      get "/api/v1/items/find_all?merchant_id=#{@item.merchant_id}"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      items = raw["data"]

      expect(items.count).to eq(1)
      expect(items[0]["id"]).to eq(@item.id.to_s)
      expect(items[0]["attributes"]["merchant_id"].to_i).to eq(@item.merchant_id)
    end
  end
end
