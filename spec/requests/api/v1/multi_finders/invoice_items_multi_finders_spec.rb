require "rails_helper"

RSpec.describe "InvoiceItem find_all endpoints" do
  before :each do
    @list = create_list(:invoice_item, 5, created_at: "2012-03-27 14:53:59 UTC", updated_at: "2012-03-27 14:53:59 UTC")
    @invoice_item = @list[0]
  end

  describe "returns all invoice_items that match the query" do
    it "finds based on id" do
      get "/api/v1/invoice_items/find_all?id=#{@invoice_item.id}"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      invoice_items = raw["data"]

      expect(invoice_items.count).to eq(1)
      expect(invoice_items[0]["id"].to_i).to eq(@invoice_item.id)
    end

    it "finds based on quantity" do
      get "/api/v1/invoice_items/find_all?quantity=#{@invoice_item.quantity}"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      invoice_items = raw["data"]

      expect(invoice_items.count).to eq(5)
      expect(invoice_items[0]["attributes"]["quantity"].to_i).to eq(@invoice_item.quantity)
      expect(invoice_items[-1]["attributes"]["quantity"].to_i).to eq(@invoice_item.quantity)
    end

    it "finds based on unit_price" do
      get "/api/v1/invoice_items/find_all?unit_price=#{(@invoice_item.unit_price/100.00).to_s}"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      invoice_items = raw["data"]

      expect(invoice_items.count).to eq(5)
      expect(invoice_items[0]["attributes"]["unit_price"]).to eq((@invoice_item.unit_price/100.00).to_s)
      expect(invoice_items[-1]["attributes"]["unit_price"]).to eq((@invoice_item.unit_price/100.00).to_s)
    end

    it "finds based on created_at" do
      get "/api/v1/invoice_items/find_all?created_at=2012-03-27 14:53:59 UTC"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      invoice_items = raw["data"]

      expect(invoice_items.count).to eq(5)
      expect(invoice_items[0]["id"].to_i).to eq(@invoice_item.id)
    end

    it "finds based on updated_at" do
      get "/api/v1/invoice_items/find_all?updated_at=2012-03-27 14:53:59 UTC"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      invoice_items = raw["data"]

      expect(invoice_items.count).to eq(5)
      expect(invoice_items[0]["id"].to_i).to eq(@invoice_item.id)
    end

    it "finds based on invoice_id" do
      get "/api/v1/invoice_items/find_all?invoice_id=#{@invoice_item.invoice_id}"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      invoice_items = raw["data"]

      expect(invoice_items.count).to eq(1)
      expect(invoice_items[0]["id"]).to eq(@invoice_item.id.to_s)
      expect(invoice_items[0]["attributes"]["invoice_id"].to_i).to eq(@invoice_item.invoice_id)
    end

    it "finds based on item_id" do
      get "/api/v1/invoice_items/find_all?item_id=#{@invoice_item.item_id}"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      invoice_items = raw["data"]

      expect(invoice_items.count).to eq(1)
      expect(invoice_items[0]["id"]).to eq(@invoice_item.id.to_s)
      expect(invoice_items[0]["attributes"]["item_id"].to_i).to eq(@invoice_item.item_id)
    end
  end
end
