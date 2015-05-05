json.listings(@listings) do |listing|
  json.extract! listing, :id, :title, :description, :status, :count, :expiry_date, :user_id, :category_id
  json.url listing_url(listing, format: :json)

  json.price listing.price

  json.expiry listing.expiry_date.to_time.strftime('%a, %e %b %Y at %l:%M %p')

  json.category listing.category, :id, :name
  json.user listing.user, :id, :name
  json.image listing.image.url(:medium)
end

json.user current_user