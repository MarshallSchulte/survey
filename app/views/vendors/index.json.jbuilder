json.array!(@vendors) do |vendor|
  json.extract! vendor, :id, :name, :address, :city, :vtype, :size, :created_at
  json.url vendor_url(vendor, format: :json)
end
