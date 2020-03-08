require "rails_helper"

RSpec.describe "Merchant find_all endpoints" do
  before :each do
    @list = create_list(:merchant, 5, created_at: "2012-03-27 14:53:59 UTC", updated_at: "2012-03-27 14:53:59 UTC")
    @merchant = @list[0]
  end

  describe "returns all merchants that match the query" do
    it "finds based on id" do
      get "/api/v1/merchants/find_all?id=#{@merchant.id}"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      merchant = raw["data"]

      expect(merchant[0]["id"].to_i).to eq(@merchant.id)
    end

    it "finds based on name" do
      get "/api/v1/merchants/find_all?name=#{@merchant.name}"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      merchants = raw["data"]

      expect(merchants.count).to eq(5)
      expect(merchants[0]["attributes"]["name"]).to eq(@merchant.name)
      expect(merchants[-1]["attributes"]["name"]).to eq(@merchant.name)
    end

    it "finds based on created_at" do
      get "/api/v1/merchants/find_all?created_at=2012-03-27 14:53:59 UTC"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      merchants = raw["data"]

      expect(merchants.count).to eq(5)
      expect(merchants[0]["id"].to_i).to eq(@merchant.id)
    end

    it "finds based on updated_at" do
      get "/api/v1/merchants/find_all?updated_at=2012-03-27 14:53:59 UTC"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      merchants = raw["data"]

      expect(merchants.count).to eq(5)
      expect(merchants[0]["id"].to_i).to eq(@merchant.id)
    end
  end
end
