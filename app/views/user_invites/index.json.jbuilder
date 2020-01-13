json.array!(@user_invites) do |user_invite|
  json.extract! user_invite, :id, :first, :last, :email, :invited
  json.url user_invite_url(user_invite, format: :json)
end
