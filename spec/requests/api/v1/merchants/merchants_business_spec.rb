require "rails_helper"

RSpec.describe "Merchants business endpoints" do
  describe "most_revenue?quantity=x" do
    it "returns top x merchants ranked by total revenue" do
      x = 2
      merchants = create_list(:merchant, 5)
      create_list(:invoice, 3, merchant_id: merchants[0].id)
      create_list(:invoice, 6, merchant_id: merchants[2].id)
      create(:invoice, merchant_id: merchants[4].id)
      create(:invoice, merchant_id: merchants[1].id)
      Invoice.all.map { |i| create(:invoice_item, invoice_id: i.id) }

      get "/api/v1/merchants/most_revenue?quantity=#{x}"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      merchants = raw["data"]

      expect(merchants.count).to eq(2)
      expect(merchants[0]["id"].to_i).to eq(merchants[2].id)
      expect(merchants[1]["id"].to_i).to eq(merchants[0].id)
      expect(merchants[0]["type"]).to eq("merchants")
      expect(merchants[0].keys).to eq(["id", "type", "attributes"])
      expect(merchants[0]["attributes"].keys).to eq(["name"])
    end
  end
end
