require "rails_helper"

RSpec.describe "Transactions relationships endpoints" do
  it "returns the invoice associated with a transaction" do
    id = create(:invoice).id
    transaction = create(:transaction, invoice_id: id)

    get "/api/v1/transactions/#{transaction.id}/invoice"

    expect(response).to be_successful

    raw = JSON.parse(response.body)
    invoice = raw["data"]

    expect(invoice["id"].to_i).to eq(id)
    expect(invoice["type"]).to eq("invoices")
    expect(invoice.keys).to eq(["id", "type", "attributes"])
    expect(invoice["attributes"].keys).to eq(["id", "status", "customer_id", "merchant_id"])
  end
end
