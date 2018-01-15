json.extract! practitioner, :id, :first_name, :last_name, :profession, :created_at, :updated_at
json.url practitioner_url(practitioner, format: :json)
