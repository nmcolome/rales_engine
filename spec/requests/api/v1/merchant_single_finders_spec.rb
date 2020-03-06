require "rails_helper"

RSpec.describe "Merchant find endpoints" do
  describe "returns a single merchant based on any its attributes" do
    it "finds based on id" do
      id = create(:merchant).id

      get "/api/v1/merchants/find?id=#{id}"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      merchant = raw["data"]

      expect(merchant["id"].to_i).to eq(id)
    end

    it "finds based on name" do
      name = create(:merchant).name

      get "/api/v1/merchants/find?name=#{name}"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      merchant = raw["data"]

      expect(merchant["attributes"]["name"]).to eq(name)
    end
  end
end
