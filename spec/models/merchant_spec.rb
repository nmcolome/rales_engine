require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe "attributes" do
    it { should respond_to :name }
  end
end
