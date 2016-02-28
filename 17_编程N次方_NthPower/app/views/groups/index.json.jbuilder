json.array!(@groups) do |group|
  json.extract! group, :id, :groupname, :user_id, :disksize
  json.url group_url(group, format: :json)
end
