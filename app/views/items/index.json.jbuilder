json.array!(@items) do |item|
  json.extract! item, :id, :name, :price, :description, :image_ur, :img_url_big, :category
  json.url item_url(item, format: :json)
end
