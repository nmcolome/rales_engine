require "rails_helper"

RSpec.describe "InvoiceItem find endpoints" do
  before :each do
    @invoice_item = create(:invoice_item, created_at: "2012-03-27 14:53:59 UTC", updated_at: "2012-03-27 14:53:59 UTC")
  end

  describe "returns an invoice_item based on any of its attributes" do
    it "finds based on id" do
      get "/api/v1/invoice_items/find?id=#{@invoice_item.id}"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      invoice_item = raw["data"]

      expect(invoice_item["id"].to_i).to eq(@invoice_item.id)
    end

    it "finds based on quantity" do
      get "/api/v1/invoice_items/find?quantity=#{@invoice_item.quantity}"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      invoice_item = raw["data"]

      expect(invoice_item["attributes"]["quantity"].to_i).to eq(@invoice_item.quantity)
    end

    it "finds based on unit_price" do
      get "/api/v1/invoice_items/find?unit_price=#{@invoice_item.unit_price}"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      invoice_item = raw["data"]

      expect(invoice_item["attributes"]["unit_price"].to_i).to eq(@invoice_item.unit_price)
    end

    it "finds based on created_at" do
      get "/api/v1/invoice_items/find?created_at=2012-03-27 14:53:59 UTC"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      invoice_item = raw["data"]

      expect(invoice_item["id"].to_i).to eq(@invoice_item.id)
    end

    it "finds based on updated_at" do
      get "/api/v1/invoice_items/find?updated_at=2012-03-27 14:53:59 UTC"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      invoice_item = raw["data"]

      expect(invoice_item["id"].to_i).to eq(@invoice_item.id)
    end
  end
end
