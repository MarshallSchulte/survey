json.array!(@kpis) do |kpi|
  json.extract! kpi, :id, :metric_id, :kpi, :kpi_measurement, :original_kpi_id
  json.url kpi_url(kpi, format: :json)
end
