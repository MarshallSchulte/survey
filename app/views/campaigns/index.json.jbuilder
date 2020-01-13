json.array!(@campaigns) do |campaign|
  json.extract! campaign, :id, :tier, :name, :status, :start_date, :end_date, :user_id
  json.url campaign_url(campaign, format: :json)
end
