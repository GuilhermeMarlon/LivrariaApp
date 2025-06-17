json.extract! rental, :id, :user_id, :book_id, :rent_date, :return_date, :created_at, :updated_at
json.url rental_url(rental, format: :json)
