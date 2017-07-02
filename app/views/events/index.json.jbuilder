json.array!(@events) do |event|
  json.extract! event, :id, :name, :date, :is_public, :location
  json.url event_url(event, format: :json)
end
