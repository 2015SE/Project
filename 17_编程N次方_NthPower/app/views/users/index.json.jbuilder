json.array!(@users) do |user|
  json.extract! user, :id, :username, :password, :disksize, :usesize
  json.url user_url(user, format: :json)
end
