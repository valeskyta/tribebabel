json.array!(@invitation_lists) do |invitation_list|
  json.extract! invitation_list, :id, :event_id, :status, :user_id
  json.url invitation_list_url(invitation_list, format: :json)
end
