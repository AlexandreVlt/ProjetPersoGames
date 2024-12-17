require 'httparty'

puts "On efface les jeux"
Game.delete_all
# https://api.rawg.io/api/games/3498?key=73f9f9c4d88144b2b79b0eabe9b7e9ca
api_key = ENV['API_RAWG']
url = "https://api.rawg.io/api/games?key=#{api_key}"
response = HTTParty.get(url)
data = JSON.parse(response.body)
all_data = data["results"]
all_data.each do |game|
  Game.create(name: game["name"], released: game["released"], background_image: game["background_image"], rating: game["rating"], genre: game["genres"][0]["name"])
end



puts "Finis"
