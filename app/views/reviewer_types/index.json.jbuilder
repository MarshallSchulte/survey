json.array!(@reviewer_types) do |reviewer_type|
  json.extract! reviewer_type, :id, :name
  json.url reviewer_type_url(reviewer_type, format: :json)
end
