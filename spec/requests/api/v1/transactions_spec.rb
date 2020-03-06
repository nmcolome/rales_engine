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

  it "returns a specific transaction based on id" do
    id = create(:transaction).id

    get "/api/v1/transactions/#{id}"

    expect(response).to be_successful

    raw = JSON.parse(response.body)
    transaction = raw["data"]

    expect(transaction["id"].to_i).to eq(id)
    expect(transaction.keys).to eq(%w[id type attributes relationships])
    expect(transaction["type"]).to eq("transactions")
    expect(transaction["attributes"].keys).to eq(%w[credit_card_number credit_card_expiration_date result])
    expect(transaction["relationships"].keys).to eq(["invoice"])
  end
end
