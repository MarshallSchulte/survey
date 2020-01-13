json.array!(@customers) do |customer|
  json.extract! customer, :id, :name, :address, :city, :state, :poc_first_name, :poc_last_name, :poc_email, :poc_phone, :ctype, :size
  json.url customer_url(customer, format: :json)
end
