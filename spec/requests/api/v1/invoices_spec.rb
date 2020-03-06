require "rails_helper"

RSpec.describe "Invoices endpoints" do
  it "returns all invoices" do
    create_list(:invoice, 5)

    get "/api/v1/invoices"

    expect(response).to be_successful

    raw = JSON.parse(response.body)
    invoices = raw["data"]

    expect(invoices.count).to eq(5)
  end

  it "returns a specific invoice based on id" do
    id = create(:invoice).id

    get "/api/v1/invoices/#{id}"

    expect(response).to be_successful

    raw = JSON.parse(response.body)
    invoice = raw["data"]

    expect(invoice["id"].to_i).to eq(id)
    expect(invoice.keys).to eq(%w[id type attributes relationships])
    expect(invoice["type"]).to eq("invoices")
    expect(invoice["attributes"].keys).to eq(["status"])
    expect(invoice["relationships"].keys).to eq(%w[customer merchant transactions invoice_items items])
  end
end
