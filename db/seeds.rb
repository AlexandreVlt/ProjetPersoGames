require 'httparty'

puts "On efface les jeux"
Game.delete_all
# https://api.rawg.io/api/games/3498?key=73f9f9c4d88144b2b79b0eabe9b7e9ca
api_key = ENV['API_RAWG']
url1 = "https://api.rawg.io/api/games/3498?key=#{api_key}"
response = HTTParty.get(url1)
data = JSON.parse(response.body)
puts data["name"]
puts data["released"]
puts data["background_image"]
puts data["rating"]
puts data["genres"][0]["name"]

Game.create(name: data["name"], released: data["released"], background_image: data["background_image"], rating: data["rating"], genre: data["genres"][0]["name"])

puts "Finis"
