json.array!(@players) do |player|
  json.extract! player, :id, :name, :balance
  json.url player_url(player, format: :json)
end
