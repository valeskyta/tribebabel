json.array!(@events) do |event|
  json.extract! event, :id, :title, :description, :event_date, :hour, :visibility
  json.url event_url(event, format: :json)
end
