json.array!(@wildfires) do |wildfire|
  json.extract! wildfire, :id, :start_date, :end_date, :description, :area_burned, :fatalities
  json.url wildfire_url(wildfire, format: :json)
end
