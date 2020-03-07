require "rails_helper"

RSpec.describe "Transaction find_all endpoints" do
  before :each do
    @list = create_list(:transaction, 5, credit_card_expiration_date: "2018-03-27", created_at: "2012-03-27 14:53:59 UTC", updated_at: "2012-03-27 14:53:59 UTC")
    @transaction = @list[0]
  end

  describe "returns all transactions that match the query" do
    it "finds based on id" do
      get "/api/v1/transactions/find_all?id=#{@transaction.id}"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      transaction = raw["data"]

      expect(transaction["id"].to_i).to eq(@transaction.id)
    end

    it "finds based on credit_card_number" do
      get "/api/v1/transactions/find_all?credit_card_number=#{@transaction.credit_card_number}"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      transactions = raw["data"]

      expect(transactions.count).to eq(5)
    expect(transactions[0]["attributes"]["credit_card_number"]).to eq(@transaction.credit_card_number)
      expect(transactions[-1]["attributes"]["credit_card_number"]).to eq(@transaction.credit_card_number)
    end

    it "finds based on credit_card_expiration_date" do
      get "/api/v1/transactions/find_all?credit_card_expiration_date=2018-03-27"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      transactions = raw["data"]

      expect(transactions.count).to eq(5)
    expect(transactions[0]["attributes"]["credit_card_expiration_date"]).to eq(@transaction.credit_card_expiration_date.to_s)
      expect(transactions[-1]["attributes"]["credit_card_expiration_date"]).to eq(@transaction.credit_card_expiration_date.to_s)
    end

    it "finds based on result" do
      get "/api/v1/transactions/find_all?result=#{@transaction.result}"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      transactions = raw["data"]

      expect(transactions.count).to eq(5)
    expect(transactions[0]["attributes"]["result"]).to eq(@transaction.result)
      expect(transactions[-1]["attributes"]["result"]).to eq(@transaction.result)
    end

    it "finds based on created_at" do
      get "/api/v1/transactions/find_all?created_at=2012-03-27 14:53:59 UTC"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      transactions = raw["data"]

      expect(transactions.count).to eq(5)
    expect(transactions[0]["id"].to_i).to eq(@transaction.id)
    end

    it "finds based on updated_at" do
      get "/api/v1/transactions/find_all?updated_at=2012-03-27 14:53:59 UTC"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      transactions = raw["data"]

      expect(transactions.count).to eq(5)
    expect(transactions[0]["id"].to_i).to eq(@transaction.id)
    end

    context "test the search is case insensitive" do
      it "finds based on result when it's all in upcase" do
        get "/api/v1/transactions/find_all?result=#{@transaction.result.upcase}"

        expect(response).to be_successful

        raw = JSON.parse(response.body)
        transactions = raw["data"]

        expect(transactions.count).to eq(5)
        expect(transactions[0]["attributes"]["result"]).to eq(@transaction.result)
        expect(transactions[-1]["attributes"]["result"]).to eq(@transaction.result)
      end
    end
  end
end
