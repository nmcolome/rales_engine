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
end
