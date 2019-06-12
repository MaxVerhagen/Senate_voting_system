json.extract! vote, :id, :preference, :created_at, :updated_at
json.url vote_url(vote, format: :json)
