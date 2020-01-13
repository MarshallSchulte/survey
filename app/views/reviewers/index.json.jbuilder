json.array!(@reviewers) do |reviewer|
  json.extract! reviewer, :id, :first_name, :last_name, :email
  json.url reviewer_url(reviewer, format: :json)
end
