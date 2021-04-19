json.extract! contact, :id, :email, :first, :last, :type_of_contact, :phone, :interests, :created_at, :updated_at
json.url contact_url(contact, format: :json)
