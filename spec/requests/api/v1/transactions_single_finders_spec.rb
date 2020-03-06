require "rails_helper"

RSpec.describe "Transaction find endpoints" do
  before :each do
    @transaction = create(:transaction, credit_card_expiration_date: "2018-03-27", created_at: "2012-03-27 14:53:59 UTC", updated_at: "2012-03-27 14:53:59 UTC")
  end

  describe "returns a single transaction based on any its attributes" do
    it "finds based on id" do
      get "/api/v1/transactions/find?id=#{@transaction.id}"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      transaction = raw["data"]

      expect(transaction["id"].to_i).to eq(@transaction.id)
    end

    it "finds based on credit_card_number" do
      get "/api/v1/transactions/find?credit_card_number=#{@transaction.credit_card_number}"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      transaction = raw["data"]

      expect(transaction["attributes"]["credit_card_number"]).to eq(@transaction.credit_card_number)
    end

    it "finds based on credit_card_expiration_date" do
      get "/api/v1/transactions/find?credit_card_expiration_date=2018-03-27"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      transaction = raw["data"]

      expect(transaction["attributes"]["credit_card_expiration_date"]).to eq(@transaction.credit_card_expiration_date)
    end

    it "finds based on result" do
      get "/api/v1/transactions/find?result=#{@transaction.result}"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      transaction = raw["data"]

      expect(transaction["attributes"]["result"]).to eq(@transaction.result)
    end

    it "finds based on created_at" do
      get "/api/v1/transactions/find?created_at=2012-03-27 14:53:59 UTC"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      transaction = raw["data"]

      expect(transaction["id"].to_i).to eq(@transaction.id)
    end

    it "finds based on updated_at" do
      get "/api/v1/transactions/find?updated_at=2012-03-27 14:53:59 UTC"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      transaction = raw["data"]

      expect(transaction["id"].to_i).to eq(@transaction.id)
    end
  end
end
