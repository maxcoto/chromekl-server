json.array!(@users) do |user|
  json.extract! user, :id, :name, :enabled, :token
  json.url user_url(user, format: :json)
end
