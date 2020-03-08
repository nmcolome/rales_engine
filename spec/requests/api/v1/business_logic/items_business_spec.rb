require "rails_helper"

RSpec.describe "Items business endpoints" do
  context "all items endpoints" do
    describe "/api/v1/items/most_revenue?quantity=x" do
      it "returns top x items ranked by total revenue" do
        x = 2
        item_list = create_list(:item, 5)
        create_list(:invoice_item, 3, item_id: item_list[0].id)
        create_list(:invoice_item, 6, item_id: item_list[2].id)
        create(:invoice_item, item_id: item_list[4].id)
        create(:invoice_item, item_id: item_list[1].id)
        Invoice.all.each { |i| create(:transaction, invoice_id: i.id) }

        get "/api/v1/items/most_revenue?quantity=#{x}"

        expect(response).to be_successful

        raw = JSON.parse(response.body)
        items = raw["data"]

        expect(items.count).to eq(2)
        expect(items[0]["id"].to_i).to eq(item_list[2].id)
        expect(items[1]["id"].to_i).to eq(item_list[0].id)
        expect(items[0]["type"]).to eq("items")
        expect(items[0].keys).to eq(["id", "type", "attributes"])
        expect(items[0]["attributes"].keys).to eq(["id", "name", "description", "unit_price", "merchant_id"])
      end
    end
  end

  context "single item endpoint" do
    describe "/api/v1/items/:id/best_day" do
      it "returns the date with the most sales an item using the invoice date. If there are multiple days with equal number of sales, it returns the most recent day" do
        item = create(:item)
        create_list(:invoice, 5, created_at: "2012-03-17 18:57:35 UTC")
        Invoice.all.each { |i| create(:invoice_item, item_id: item.id, invoice_id: i.id, created_at: "2012-03-17 18:57:35 UTC") }
        other = create_list(:invoice, 2)
        other.each { |invoice| create(:invoice_item, item_id: item.id, invoice_id: invoice.id) }
        Invoice.all.each { |i| create(:transaction, invoice_id: i.id) }
        Invoice.all.each { |i| create(:transaction, invoice_id: i.id) }

        get "/api/v1/items/#{item.id}/best_day"

        expect(response).to be_successful

        raw = JSON.parse(response.body)
        best_day = raw["data"]

        expect(best_day.keys).to eq(%w[id type attributes])
        expect(best_day["type"]).to eq("days")
        expect(best_day["attributes"].keys).to eq(["best_day"])
      end
    end
  end
end
