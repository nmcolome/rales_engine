require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "attributes" do
    it { should respond_to :name }
    it { should respond_to :description }
    it { should respond_to :unit_price }
  end

  describe "relationships" do
    it { should belong_to :merchant }
  end
end
