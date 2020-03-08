class RevenuesSerializer
  include FastJsonapi::ObjectSerializer
  attributes :total_revenue

  attribute :total_revenue do |object|
    (object.revenue/100.00).to_s
  end
end
