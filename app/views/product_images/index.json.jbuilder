json.array!(@product_images) do |product_image|
  json.extract! product_image, :cation, :string, :product_id, :integer
  json.url product_image_url(product_image, format: :json)
end