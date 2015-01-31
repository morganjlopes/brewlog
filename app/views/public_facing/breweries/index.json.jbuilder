json.array!(@breweries) do |brewery|
  json.extract! brewery, :id, :name, :slogan
  json.url brewery_url(brewery, format: :json)
end
