json.array!(@usergroups) do |usergroup|
  json.extract! usergroup, :id, :user_id, :group_id, :diaplayname
  json.url usergroup_url(usergroup, format: :json)
end
