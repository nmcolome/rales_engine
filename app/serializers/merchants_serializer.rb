class MerchantsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name
end
