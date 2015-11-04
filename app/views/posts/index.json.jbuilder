json.array!(@posts) do |post|
  json.extract! post, :id, :titulo
  json.url post_url(post, format: :json)
end
