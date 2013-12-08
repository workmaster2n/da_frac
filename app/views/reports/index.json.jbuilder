json.array!(@reports) do |report|
  json.extract! report, :id, :well_name, :attributes
  json.url report_url(report, format: :json)
end
