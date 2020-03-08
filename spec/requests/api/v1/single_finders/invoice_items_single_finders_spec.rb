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

      expect(invoice_item["id"]).to eq(@invoice_item.id.to_s)
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

      expect(invoice_item["attributes"]["unit_price"]).to eq((@invoice_item.unit_price/100.00).to_s)
    end

    it "finds based on created_at" do
      get "/api/v1/invoice_items/find?created_at=2012-03-27 14:53:59 UTC"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      invoice_item = raw["data"]

      expect(invoice_item["id"]).to eq(@invoice_item.id.to_s)
    end

    it "finds based on updated_at" do
      get "/api/v1/invoice_items/find?updated_at=2012-03-27 14:53:59 UTC"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      invoice_item = raw["data"]

      expect(invoice_item["id"]).to eq(@invoice_item.id.to_s)
    end

    it "finds based on invoice_id" do
      get "/api/v1/invoice_items/find?invoice_id=#{@invoice_item.invoice_id}"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      invoice_item = raw["data"]

      expect(invoice_item["id"]).to eq(@invoice_item.id.to_s)
      expect(invoice_item["attributes"]["invoice_id"].to_i).to eq(@invoice_item.invoice_id)
    end

    it "finds based on item_id" do
      get "/api/v1/invoice_items/find?item_id=#{@invoice_item.item_id}"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      invoice_item = raw["data"]

      expect(invoice_item["id"]).to eq(@invoice_item.id.to_s)
      expect(invoice_item["attributes"]["item_id"].to_i).to eq(@invoice_item.item_id)
    end
  end
end
