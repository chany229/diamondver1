json.extract! admin_record, :id, :ip_string, :useragent, :created_at, :updated_at
json.url admin_record_url(admin_record, format: :json)
