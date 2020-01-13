json.array!(@vtypes) do |vtype|
  json.extract! vtype, :id, :vendor_id, :name
  json.url vtype_url(vtype, format: :json)
end
