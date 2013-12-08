json.array!(@stages) do |stage|
  json.extract! stage, :id, :well_id, :frac_date, :gpi, :gpi2, :top_perf, :bottom_perf, :stage_length, :shots
  json.url stage_url(stage, format: :json)
end
