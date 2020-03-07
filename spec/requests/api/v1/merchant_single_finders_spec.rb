require "rails_helper"

RSpec.describe "Merchant find endpoints" do
  before :each do
    @merchant = create(:merchant, created_at: "2012-03-27 14:53:59 UTC", updated_at: "2012-03-27 14:53:59 UTC")
  end

  describe "returns a single merchant based on any its attributes" do
    it "finds based on id" do
      get "/api/v1/merchants/find?id=#{@merchant.id}"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      merchant = raw["data"]

      expect(merchant["id"].to_i).to eq(@merchant.id)
    end

    it "finds based on name" do
      get "/api/v1/merchants/find?name=#{@merchant.name}"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      merchant = raw["data"]

      expect(merchant["attributes"]["name"]).to eq(@merchant.name)
    end

    it "finds based on created_at" do
      get "/api/v1/merchants/find?created_at=2012-03-27 14:53:59 UTC"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      merchant = raw["data"]

      expect(merchant["id"].to_i).to eq(@merchant.id)
    end

    it "finds based on updated_at" do
      get "/api/v1/merchants/find?updated_at=2012-03-27 14:53:59 UTC"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      merchant = raw["data"]

      expect(merchant["id"].to_i).to eq(@merchant.id)
    end

    context "test the search is case insensitive" do
      it "finds based on name when it's all in upcase" do
        get "/api/v1/merchants/find?name=#{@merchant.name.upcase}"

        expect(response).to be_successful

        raw = JSON.parse(response.body)
        merchant = raw["data"]

        expect(merchant["attributes"]["name"]).to eq(@merchant.name)
      end
    end
  end
end
