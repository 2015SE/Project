json.array!(@user_files) do |user_file|
  json.extract! user_file, :id, :user_id, :file_id, :filename
  json.url user_file_url(user_file, format: :json)
end
