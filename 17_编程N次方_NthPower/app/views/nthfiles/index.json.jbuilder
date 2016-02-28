json.array!(@nthfiles) do |nthfile|
  json.extract! nthfile, :id, :rename, :filesize, :count, :resize
  json.url nthfile_url(nthfile, format: :json)
end
