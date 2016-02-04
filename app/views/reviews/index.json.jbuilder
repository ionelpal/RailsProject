json.array!(@reviews) do |review|
  json.extract! review, :id, :productname, :reviwtext, :itemrate,:user_id
  json.url review_url(review, format: :json)
end
