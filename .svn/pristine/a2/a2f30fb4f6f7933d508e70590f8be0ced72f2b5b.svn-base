json.array!(@metrics) do |metric|
  json.extract! metric, :id, :metric_name
  json.url metric_url(metric, format: :json)
end
