require "rails_helper"

RSpec.describe "Customer find endpoint" do
  describe "returns a single customer based on any of the object's attributes" do
    it "finds based on id" do
      id = create(:customer).id

      get "/api/v1/customers/find?id=#{id}"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      customer = raw["data"]

      expect(customer["id"].to_i).to eq(id)
    end

    it "finds based on first name" do
      first_name = create(:customer).first_name

      get "/api/v1/customers/find?first_name=#{first_name}"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      customer = raw["data"]

      expect(customer["attributes"]["first_name"]).to eq(first_name)
    end

    it "finds based on last name" do
      last_name = create(:customer).last_name

      get "/api/v1/customers/find?last_name=#{last_name}"

      expect(response).to be_successful

      raw = JSON.parse(response.body)
      customer = raw["data"]

      expect(customer["attributes"]["last_name"]).to eq(last_name)
    end
  end
end
