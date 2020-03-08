require "rails_helper"

RSpec.describe "Customer relationships endpoints" do
  it "returns all invoices associated with a customer" do
    id = create(:customer).id
    customer_invoices = create_list(:invoice, 10, customer_id: id)

    get "/api/v1/customers/#{id}/invoices"

    expect(response).to be_successful

    raw = JSON.parse(response.body)
    invoices = raw["data"]

    expect(invoices.count).to eq(10)
    expect(invoices[0]["id"].to_i).to eq(customer_invoices[0].id)
    expect(invoices[0]["type"]).to eq("invoices")
    expect(invoices[0].keys).to eq(["id", "type", "attributes"])
    expect(invoices[0]["attributes"].keys).to eq(["id", "status", "customer_id", "merchant_id"])
  end

  it "returns all transactions associated with a customer" do
    id = create(:customer).id
    invoices = create_list(:invoice, 3, customer_id: id)
    customer_transactions = invoices.map do |invoice|
      create_list(:transaction, 3, invoice_id: invoice.id)
    end

    get "/api/v1/customers/#{id}/transactions"

    expect(response).to be_successful

    raw = JSON.parse(response.body)
    transactions = raw["data"]

    expect(transactions.count).to eq(9)
    expect(transactions[0]["id"].to_i).to eq(customer_transactions.flatten[0].id)
    expect(transactions[0]["type"]).to eq("transactions")
    expect(transactions[0].keys).to eq(["id", "type", "attributes"])
    expect(transactions[0]["attributes"].keys).to eq(["id", "credit_card_number", "result", "invoice_id"])
  end
end
