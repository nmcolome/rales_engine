require "rails_helper"

RSpec.describe "Customer find endpoint" do
  before :each do
    @customer = create(:customer, created_at: "2012-03-27 14:53:59 UTC", updated_at: "2012-03-27 14:53:59 UTC")
  end

  describe "returns a single customer based on any of the object's attributes" do
    it "finds based on id" do
      get "/api/v1/customers/find?id=#{@customer.id}"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      customer = raw["data"]

      expect(customer["id"].to_i).to eq(@customer.id)
    end

    it "finds based on first_name" do
      get "/api/v1/customers/find?first_name=#{@customer.first_name}"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      customer = raw["data"]

      expect(customer["attributes"]["first_name"]).to eq(@customer.first_name)
    end

    it "finds based on last_name" do
      get "/api/v1/customers/find?last_name=#{@customer.last_name}"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      customer = raw["data"]

      expect(customer["attributes"]["last_name"]).to eq(@customer.last_name)
    end

    it "finds based on created_at" do
      get "/api/v1/customers/find?created_at=2012-03-27 14:53:59 UTC"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      customer = raw["data"]

      expect(customer["id"].to_i).to eq(@customer.id)
    end

    it "finds based on updated_at" do
      get "/api/v1/customers/find?updated_at=2012-03-27 14:53:59 UTC"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      customer = raw["data"]

      expect(customer["id"].to_i).to eq(@customer.id)
    end

    context "test the search is case insensitive" do
      it "finds based on first_name when it's all in upcase" do
        get "/api/v1/customers/find?first_name=#{@customer.first_name.upcase}"

        expect(response).to be_successful

        raw = JSON.parse(response.body)
        customer = raw["data"]

        expect(customer["attributes"]["first_name"]).to eq(@customer.first_name)
      end
    end
  end
end
