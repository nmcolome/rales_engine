require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do
  describe "attributes" do
    it { should respond_to :quantity }
    it { should respond_to :unit_price }
  end

  describe "relationships" do
    it { should belong_to :item }
    it { should belong_to :invoice }
  end
end
