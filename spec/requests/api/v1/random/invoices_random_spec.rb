require "rails_helper"

RSpec.describe "Invoice random endpoint" do
  it "returns a random resource" do
    create_list(:invoice, 10)
    invoices = []

    get "/api/v1/invoices/random"

    expect(response).to be_successful

    raw = JSON.parse(response.body)
    invoices << raw["data"]

    expect(raw.count).to eq(1)

    get "/api/v1/invoices/random"
    invoices << JSON.parse(response.body)["data"]

    get "/api/v1/invoices/random"
    invoices << JSON.parse(response.body)["data"]

    get "/api/v1/invoices/random"
    invoices << JSON.parse(response.body)["data"]

    expect(invoices.pluck("id").uniq.count).to be > 1
  end
end
