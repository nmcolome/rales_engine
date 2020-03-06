require "rails_helper"

RSpec.describe "Transactions endpoints" do
  it "returns all transactions" do
    create_list(:transaction, 5)

    get "/api/v1/transactions"

    expect(response).to be_successful

    raw = JSON.parse(response.body)
    transactions = raw["data"]

    expect(transactions.count).to eq(5)
  end
end
