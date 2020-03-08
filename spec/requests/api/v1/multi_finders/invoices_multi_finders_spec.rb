require "rails_helper"

RSpec.describe "Invoice find_all endpoints" do
  before :each do
    @list = create_list(:invoice, 5, created_at: "2012-03-27 14:53:59 UTC", updated_at: "2012-03-27 14:53:59 UTC")
    @invoice = @list[0]
  end

  describe "returns all invoices that match the query" do
    it "finds based on id" do
      get "/api/v1/invoices/find_all?id=#{@invoice.id}"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      invoices = raw["data"]

      expect(invoices.count).to eq(1)
      expect(invoices[0]["id"].to_i).to eq(@invoice.id)
    end

    it "finds based on status" do
      get "/api/v1/invoices/find_all?status=#{@invoice.status}"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      invoices = raw["data"]

      expect(invoices.count).to eq(5)
      expect(invoices[0]["attributes"]["status"]).to eq(@invoice.status)
      expect(invoices[-1]["attributes"]["status"]).to eq(@invoice.status)
    end

    it "finds based on created_at" do
      get "/api/v1/invoices/find_all?created_at=2012-03-27 14:53:59 UTC"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      invoices = raw["data"]

      expect(invoices.count).to eq(5)
      expect(invoices[0]["id"].to_i).to eq(@invoice.id)
    end

    it "finds based on updated_at" do
      get "/api/v1/invoices/find_all?updated_at=2012-03-27 14:53:59 UTC"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      invoices = raw["data"]

      expect(invoices.count).to eq(5)
      expect(invoices[0]["id"].to_i).to eq(@invoice.id)
    end

    it "finds based on merchant_id" do
      get "/api/v1/invoices/find_all?merchant_id=#{@invoice.merchant_id}"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      invoices = raw["data"]

      expect(invoices.count).to eq(1)
      expect(invoices[0]["id"]).to eq(@invoice.id.to_s)
      expect(invoices[0]["attributes"]["merchant_id"].to_i).to eq(@invoice.merchant_id)
    end

    it "finds based on customer_id" do
      get "/api/v1/invoices/find_all?customer_id=#{@invoice.customer_id}"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      invoices = raw["data"]

      expect(invoices.count).to eq(1)
      expect(invoices[0]["id"]).to eq(@invoice.id.to_s)
      expect(invoices[0]["attributes"]["customer_id"].to_i).to eq(@invoice.customer_id)
    end
  end
end
