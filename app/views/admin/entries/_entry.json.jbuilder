json.extract! entry, :id, :title, :desc, :content, :category_id, :user_id, :deleted_at, :created_at, :updated_at
json.url entry_url(entry, format: :json)
