require 'rails_helper'

RSpec.describe Invoice, type: :model do
  describe "attributes" do
    it { should respond_to :status }
  end

  describe "relationships" do
    it { should belong_to :customer }
    it { should belong_to :merchant }
    it { should have_many :transactions }
    it { should have_many :invoice_items }
  end

  describe "enums" do
    it { should define_enum_for(:status).with_values([:shipped, :pending, :canceled]) }
  end
end
