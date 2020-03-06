require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe "attributes" do
    it { should respond_to :credit_card_number }
    it { should respond_to :credit_card_expiration_date }
    it { should respond_to :result }
  end

  describe "relationships" do
    it { should belong_to :invoice }
  end

  describe "enums" do
    it { should define_enum_for(:result).with_values([:success, :failed]) }
  end
end
