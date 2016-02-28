json.array!(@rights) do |right|
  json.extract! right, :id, :group_id, :user_id, :file_id, :right_w, :right_r, :right_wr
  json.url right_url(right, format: :json)
end
