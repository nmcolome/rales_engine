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

      expect(item["attributes"]["unit_price"]).to eq(@item.unit_price)
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

    context "test the search is case insensitive" do
      it "finds based on name when it's all in upcase" do
        get "/api/v1/items/find?name=#{@item.name.upcase}"

        expect(response).to be_successful

        raw = JSON.parse(response.body)
        item = raw["data"]

        expect(item["attributes"]["name"]).to eq(@item.name)
      end

      it "finds based on description when it's all in downcase" do
        get "/api/v1/items/find?description=#{@item.description.downcase}"

        expect(response).to be_successful

        raw = JSON.parse(response.body)
        item = raw["data"]

        expect(item["attributes"]["description"]).to eq(@item.description)
      end
    end
  end
end
