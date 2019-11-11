json.extract! song, :id, :title, :length, :author_id, :created_at, :updated_at
json.url song_url(song, format: :json)
