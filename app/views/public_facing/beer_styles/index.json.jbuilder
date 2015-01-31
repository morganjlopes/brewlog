json.array!(@beer_styles) do |beer_style|
  json.extract! beer_style, :id, :name, :description, :alternative_names, :examples, :slug
  json.url beer_style_url(beer_style, format: :json)
end
