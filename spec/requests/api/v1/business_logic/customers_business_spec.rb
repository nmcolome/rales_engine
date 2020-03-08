require "rails_helper"

RSpec.describe "Customers business endpoints" do
  context "single customer endpoint" do
    describe "/api/v1/customers/:id/favorite_merchant" do
      it "returns a merchant where the customer has conducted the most successful transactions" do
        customer = create(:customer)
        merchant = create(:merchant)
        create_list(:invoice, 6, customer_id: customer.id, merchant_id: merchant.id)
        create_list(:invoice, 3, customer_id: customer.id)
        Invoice.all.map { |i| create(:transaction, invoice_id: i.id) }

        get "/api/v1/customers/#{customer.id}/favorite_merchant"

        expect(response).to be_successful

        raw = JSON.parse(response.body)
        fave_merchant = raw["data"]

        expect(fave_merchant["id"]).to eq(merchant.id.to_s)
        expect(fave_merchant.keys).to eq(%w[id type attributes])
        expect(fave_merchant["type"]).to eq("merchants")
        expect(fave_merchant["attributes"].keys).to eq(%w[id name])
      end
    end
  end
end
