require 'rails_helper'

RSpec.describe Invoice, type: :model do
  describe "attributes" do
    it { should respond_to :status }
  end

  describe "relationships" do
    it { should belong_to :customer }
    it { should belong_to :merchant }
  end

  describe "enums" do
    it { should define_enum_for(:status).with_values([:shipped, :pending, :canceled]) }
  end
end
