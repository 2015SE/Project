json.array!(@products) do |product|
  json.extract! product, :id, :shop_id, :title, :price, :quantity, :description, :category, :image_url, :date_available
  json.url product_url(product, format: :json)
end
