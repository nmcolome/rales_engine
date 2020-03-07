require "rails_helper"

RSpec.describe "InvoiceItem random endpoint" do
  it "returns a random resource" do
    create_list(:invoice_item, 10)
    invoice_items = []

    get "/api/v1/invoice_items/random"

    expect(response).to be_successful

    raw = JSON.parse(response.body)
    invoice_items << raw["data"]

    expect(raw.count).to eq(1)

    get "/api/v1/invoice_items/random"
    invoice_items << JSON.parse(response.body)["data"]

    get "/api/v1/invoice_items/random"
    invoice_items << JSON.parse(response.body)["data"]

    get "/api/v1/invoice_items/random"
    invoice_items << JSON.parse(response.body)["data"]

    expect(invoice_items.pluck("id").uniq.count).to be > 1
  end
end
