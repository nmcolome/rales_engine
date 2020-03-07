require "rails_helper"

RSpec.describe "Customer find_all endpoint" do
  before :each do
    @customers = create_list(:customer, 5, created_at: "2012-03-27 14:53:59 UTC", updated_at: "2012-03-27 14:53:59 UTC")
    @customer1 = @customers[0]
  end

  describe "returns a single customer based on any of the object's attributes" do
    it "finds based on id" do
      get "/api/v1/customers/find_all?id=#{@customer1.id}"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      customers = raw["data"]

      expect(customers[0]["id"].to_i).to eq(id)
    end

    it "finds based on first_name" do
      get "/api/v1/customers/find_all?first_name=#{@customer1.first_name}"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      customers = raw["data"]

      expect(customers.count).eq (5)
      expect(customers[0]["data"]["attributes"]["first_name"]).to eq(@customer1.first_name)
      expect(customers[-1]["data"]["attributes"]["first_name"]).to eq(@customer1.first_name)
    end

    it "finds based on last_name" do
      get "/api/v1/customers/find_all?last_name=#{@customer1.last_name}"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      customers = raw["data"]

      expect(customers.count).eq (5)
      expect(customers[0]["data"]["attributes"]["last_name"]).to eq(@customer1.last_name)
      expect(customers[-1]["data"]["attributes"]["last_name"]).to eq(@customer1.last_name)
    end

    it "finds based on created_at" do
      get "/api/v1/customers/find_all?created_at=2012-03-27 14:53:59 UTC"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      customers = raw["data"]

      expect(customers.count).eq (5)
      expect(customers[0]["data"]["id"].to_i).to eq(@customer1.id)
      expect(customers[-1]["data"]["id"].to_i).to eq(@customer1.id)
    end

    it "finds based on updated_at" do
      get "/api/v1/customers/find_all?updated_at=2012-03-27 14:53:59 UTC"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      customers = raw["data"]

      expect(customers.count).eq (5)
      expect(customers[0]["data"]["id"].to_i).to eq(@customer1.id)
      expect(customers[-1]["data"]["id"].to_i).to eq(@customer1.id)

    end

    context "test the search is case insensitive" do
      it "finds based on first_name when it's all in upcase" do
        get "/api/v1/customers/find_all?first_name=#{@customer1.first_name.upcase}"

        expect(response).to be_successful

        raw = JSON.parse(response.body)
        customers = raw["data"]

        expect(customers.count).eq (5)
        expect(customers[0]["data"]["attributes"]["first_name"]).to eq(@customer1.first_name)
        expect(customers[-1]["data"]["attributes"]["first_name"]).to eq(@customer1.first_name)
      end
    end
  end
end
