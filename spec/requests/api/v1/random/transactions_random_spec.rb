require "rails_helper"

RSpec.describe "Transaction random endpoint" do
  it "returns a random resource" do
    create_list(:transaction, 10)
    transactions = []

    get "/api/v1/transactions/random"

    expect(response).to be_successful

    raw = JSON.parse(response.body)
    transactions << raw["data"]

    expect(raw.count).to eq(1)

    get "/api/v1/transactions/random"
    transactions << JSON.parse(response.body)["data"]

    get "/api/v1/transactions/random"
    transactions << JSON.parse(response.body)["data"]

    get "/api/v1/transactions/random"
    transactions << JSON.parse(response.body)["data"]

    expect(transactions.pluck("id").uniq.count).to be > 1
  end
end
