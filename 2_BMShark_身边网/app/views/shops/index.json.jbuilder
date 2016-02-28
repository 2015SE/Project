json.array!(@shops) do |shop|
  json.extract! shop, :id, :name, :tel, :address, :category, :description
  json.url shop_url(shop, format: :json)
end
