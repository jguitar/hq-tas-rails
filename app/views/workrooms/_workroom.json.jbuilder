json.extract! workroom, :id, :code, :name, :floor_id, :created_at, :updated_at
json.url workroom_url(workroom, format: :json)
