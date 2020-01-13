json.array!(@metric_scores) do |metric_score|
  json.extract! metric_score, :id, :metric_id, :campaign_id, :customer_id, :vendor_id, :actual_score, :total_score
  json.url metric_score_url(metric_score, format: :json)
end
