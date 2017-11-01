json.extract! promo_request, :id, :name, :town, :min_order_price, :description, :contact_details, :created_at, :updated_at
json.url promo_request_url(promo_request, format: :json)
