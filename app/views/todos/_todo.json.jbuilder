json.extract! todo, :id, :title, :due_date, :status, :priority, :todo_type_id, :user_id, :created_at, :updated_at
json.url todo_url(todo, format: :json)
