json.extract! trip, :id, :name, :start_date, :end_date, :budget, :destination_id, :created_at, :updated_at
json.url trip_url(trip, format: :json)
