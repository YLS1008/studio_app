json.extract! trainee, :id, :email, :first, :last, :phone, :created_at, :updated_at
json.url trainee_url(trainee, format: :json)
