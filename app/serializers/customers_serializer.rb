class CustomersSerializer
  include FastJsonapi::ObjectSerializer
  attributes :first_name, :last_name
end
