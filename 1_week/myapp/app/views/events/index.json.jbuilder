json.array!(@events) do |event|
  json.extract! event, :event_date, :title, :details
  json.url event_url(event, format: :json)
end
