require "rails_helper"

RSpec.describe "Merchants business endpoints" do
  context "all merchants endpoints" do
    describe "/api/v1/merchants/most_revenue?quantity=x" do
      it "returns top x merchants ranked by total revenue" do
        x = 2
        merchant_list = create_list(:merchant, 5)
        create_list(:invoice, 3, merchant_id: merchant_list[0].id)
        create_list(:invoice, 6, merchant_id: merchant_list[2].id)
        create(:invoice, merchant_id: merchant_list[4].id)
        create(:invoice, merchant_id: merchant_list[1].id)
        Invoice.all.each { |i| create(:invoice_item, invoice_id: i.id) }
        Invoice.all.each { |i| create(:transaction, invoice_id: i.id) }

        get "/api/v1/merchants/most_revenue?quantity=#{x}"

        expect(response).to be_successful

        raw = JSON.parse(response.body)
        merchants = raw["data"]

        expect(merchants.count).to eq(2)
        expect(merchants[0]["id"].to_i).to eq(merchant_list[2].id)
        expect(merchants[1]["id"].to_i).to eq(merchant_list[0].id)
        expect(merchants[0]["type"]).to eq("merchants")
        expect(merchants[0].keys).to eq(["id", "type", "attributes"])
        expect(merchants[0]["attributes"].keys).to eq(["id", "name"])
      end
    end
  
    describe "/api/v1/merchants/revenue?date=x" do
      it "returns the total revenue for date x across all merchants" do
        merchant_list = create_list(:merchant, 5)
        create_list(:invoice, 3, merchant_id: merchant_list[0].id, created_at: "2012-03-27 14:53:59 UTC", updated_at: "2012-03-27 14:53:59 UTC")
        create_list(:invoice, 6, merchant_id: merchant_list[2].id)
        create(:invoice, merchant_id: merchant_list[4].id)
        create(:invoice, merchant_id: merchant_list[1].id)
        Invoice.all.each { |i| create(:invoice_item, invoice_id: i.id) }
        Invoice.all.each { |i| create(:transaction, invoice_id: i.id) }

        get "/api/v1/merchants/revenue?date=2012-03-27"

        expect(response).to be_successful

        raw = JSON.parse(response.body)
        result = raw["data"]

        expect(result.keys).to eq(%w[id type attributes])
        expect(result["type"]).to eq("revenues")
        expect(result["attributes"].keys).to eq(["total_revenue"])
        expect(result["attributes"]["total_revenue"]).to eq("2045.25")
      end
    end
  end

  context "single merchant endpoint" do
    describe "/api/v1/merchants/:id/favorite_customer" do
      it "returns the customer with the most total number of successful transactions" do
        merchant = create(:merchant)
        customers = create_list(:customer, 4)
        create_list(:invoice, 3, customer_id: customers[0].id, merchant_id: merchant.id)
        customers.each { |c| create(:invoice, customer_id: c.id, merchant_id: merchant.id)}
        Invoice.all.each { |i| create(:invoice_item, invoice_id: i.id) }
        Invoice.all.each { |i| create(:transaction, invoice_id: i.id) }

        get "/api/v1/merchants/#{merchant.id}/favorite_customer"

        expect(response).to be_successful

        raw = JSON.parse(response.body)
        fave_customer = raw["data"]

        expect(fave_customer["id"]).to eq(customers[0].id.to_s)
        expect(fave_customer.keys).to eq(%w[id type attributes])
        expect(fave_customer["type"]).to eq("customers")
        expect(fave_customer["attributes"].keys).to eq(%w[id first_name last_name])
      end
    end
  end
end
