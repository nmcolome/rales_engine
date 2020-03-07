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

      expect(invoice["id"].to_i).to eq(@invoice.id)
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

      expect(invoice["id"].to_i).to eq(@invoice.id)
    end

    it "finds based on updated_at" do
      get "/api/v1/invoices/find?updated_at=2012-03-27 14:53:59 UTC"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      invoice = raw["data"]

      expect(invoice["id"].to_i).to eq(@invoice.id)
    end

    context "test the search is case insensitive" do
      it "finds based on status when it's all in upcase" do
        get "/api/v1/invoices/find?status=#{@invoice.status.upcase}"

        expect(response).to be_successful

        raw = JSON.parse(response.body)
        invoice = raw["data"]

        expect(invoice["attributes"]["status"]).to eq(@invoice.status)
      end
    end
  end
end
