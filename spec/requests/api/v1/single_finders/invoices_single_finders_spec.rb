require "rails_helper"

RSpec.describe "Invoice find endpoints" do
  before :each do
    @invoice = create(:invoice, created_at: "2012-03-27 14:53:59 UTC", updated_at: "2012-03-27 14:53:59 UTC")
  end

  describe "returns an invoice based on any of its attributes" do
    it "finds based on id" do
      get "/api/v1/invoices/find?id=#{@invoice.id}"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      invoice = raw["data"]

      expect(invoice["id"]).to eq(@invoice.id.to_s)
    end

    it "finds based on status" do
      get "/api/v1/invoices/find?status=#{@invoice.status}"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      invoice = raw["data"]

      expect(invoice["attributes"]["status"]).to eq(@invoice.status)
    end

    it "finds based on created_at" do
      get "/api/v1/invoices/find?created_at=2012-03-27 14:53:59 UTC"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      invoice = raw["data"]

      expect(invoice["id"]).to eq(@invoice.id.to_s)
    end

    it "finds based on updated_at" do
      get "/api/v1/invoices/find?updated_at=2012-03-27 14:53:59 UTC"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      invoice = raw["data"]

      expect(invoice["id"]).to eq(@invoice.id.to_s)
    end

    it "finds based on merchant_id" do
      get "/api/v1/invoices/find?merchant_id=#{@invoice.merchant_id}"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      invoice = raw["data"]

      expect(invoice["id"]).to eq(@invoice.id.to_s)
      expect(invoice["attributes"]["merchant_id"].to_i).to eq(@invoice.merchant_id)
    end

    it "finds based on customer_id" do
      get "/api/v1/invoices/find?customer_id=#{@invoice.customer_id}"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      invoice = raw["data"]

      expect(invoice["id"]).to eq(@invoice.id.to_s)
      expect(invoice["attributes"]["customer_id"].to_i).to eq(@invoice.customer_id)
    end
  end
end
