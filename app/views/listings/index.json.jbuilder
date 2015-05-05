json.array!(@listings) do |listing|
  json.extract! listing, :id, :title, :description, :price, :status, :expiry_date, :user_id, :category_id
  json.url listing_url(listing, format: :json)
end
