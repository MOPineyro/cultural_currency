json.array!(@currencies) do |currency|
  json.extract! currency, :id, :title, :country, :description, :recipe_link, :music_link, :added_date
  json.url currency_url(currency, format: :json)
end
