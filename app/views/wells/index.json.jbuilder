json.array!(@wells) do |well|
  json.extract! well, :id, :name, :start_date
  json.url well_url(well, format: :json)
end
