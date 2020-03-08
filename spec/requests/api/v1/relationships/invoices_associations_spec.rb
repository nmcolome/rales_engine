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
    expect(transactions[0]["attributes"].keys).to eq(["id", "credit_card_number", "result", "invoice_id"])
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
    expect(invoice_items[0]["attributes"].keys).to eq(["id", "quantity", "unit_price", "item_id", "invoice_id"])
  end

  it "returns all items associated with an invoice" do
    id = create(:invoice).id
    invoice_items = create_list(:invoice_item, 10, invoice_id: id)

    get "/api/v1/invoices/#{id}/items"

    expect(response).to be_successful

    raw = JSON.parse(response.body)
    items = raw["data"]

    expect(items.count).to eq(10)
    expect(items[0]["type"]).to eq("items")
    expect(items[0].keys).to eq(["id", "type", "attributes"])
    expect(items[0]["attributes"].keys).to eq(["id", "name", "description", "unit_price", "merchant_id"])
  end

  it "returns the customer associated with an invoice" do
    customer = create(:customer)
    id = create(:invoice, customer_id: customer.id).id

    get "/api/v1/invoices/#{id}/customer"

    expect(response).to be_successful

    raw = JSON.parse(response.body)
    customers = raw["data"]

    expect(customers["id"].to_i).to eq(customer.id)
    expect(customers["type"]).to eq("customers")
    expect(customers.keys).to eq(["id", "type", "attributes"])
    expect(customers["attributes"].keys).to eq(["id", "first_name", "last_name"])
  end

  it "returns the merchant associated with an invoice" do
    merchant = create(:merchant)
    id = create(:invoice, merchant_id: merchant.id).id

    get "/api/v1/invoices/#{id}/merchant"

    expect(response).to be_successful

    raw = JSON.parse(response.body)
    merchants = raw["data"]

    expect(merchants["id"].to_i).to eq(merchant.id)
    expect(merchants["type"]).to eq("merchants")
    expect(merchants.keys).to eq(["id", "type", "attributes"])
    expect(merchants["attributes"].keys).to eq(["id", "name"])
  end
end
