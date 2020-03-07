require "rails_helper"

RSpec.describe "Invoices relationships endpoints" do
  it "returns all transactions associated with an invoice" do
    id = create(:invoice).id
    invoice_transactions = create_list(:transaction, 10, invoice_id: id)

    get "/api/v1/invoices/#{id}/transactions"

    expect(response).to be_successful

    raw = JSON.parse(response.body)
    transactions = raw["data"]

    expect(transactions.count).to eq(10)
    expect(transactions[0]["id"].to_i).to eq(invoice_transactions[0].id)
    expect(transactions[0]["type"]).to eq("transactions")
    expect(transactions[0].keys).to eq(["id", "type", "attributes"])
    expect(transactions[0]["attributes"].keys).to eq(["credit_card_number", "credit_card_expiration_date", "result", "invoice_id"])
  end

  it "returns all invoice_items associated with an invoice" do
    id = create(:invoice).id
    invoice_invoice_items = create_list(:invoice_item, 10, invoice_id: id)

    get "/api/v1/invoices/#{id}/invoice_items"

    expect(response).to be_successful

    raw = JSON.parse(response.body)
    invoice_items = raw["data"]

    expect(invoice_items.count).to eq(10)
    expect(invoice_items[0]["id"].to_i).to eq(invoice_invoice_items[0].id)
    expect(invoice_items[0]["type"]).to eq("invoice_items")
    expect(invoice_items[0].keys).to eq(["id", "type", "attributes"])
    expect(invoice_items[0]["attributes"].keys).to eq(["quantity", "unit_price", "item_id", "invoice_id"])
  end
end
