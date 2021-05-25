json.extract! time_slot, :id, :activity_id, :start_time, :end_time, :enrolled, :recurring, :created_at, :updated_at
json.url time_slot_url(time_slot, format: :json)
