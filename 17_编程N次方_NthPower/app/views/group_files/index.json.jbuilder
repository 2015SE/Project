json.array!(@group_files) do |group_file|
  json.extract! group_file, :id, :group_id, :file_id, :filename, :resize
  json.url group_file_url(group_file, format: :json)
end
