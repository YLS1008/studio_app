json.extract! activity, :id, :instructor_id, :name, :duration, :start_time, :end_time, :capacity, :reccuring, :created_at, :updated_at
json.url activity_url(activity, format: :json)
