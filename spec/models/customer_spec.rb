require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe "attributes" do
    it { should respond_to :first_name }
    it { should respond_to :last_name }
  end

  describe "relationships" do
    it { should have_many :invoices }
    it { should have_many(:merchants).through(:invoices) }
  end
end
