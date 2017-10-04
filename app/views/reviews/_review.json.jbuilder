json.extract! review, :id, :name, :type, :company_id, :description, :created_at, :updated_at
json.url review_url(review, format: :json)
