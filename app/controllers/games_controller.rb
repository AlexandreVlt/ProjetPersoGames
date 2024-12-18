class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
    @url_game = get_url_store(@game)
  end
end

private

def get_url_store(game)
  api_key = ENV['API_RAWG']
  url = "https://api.rawg.io/api/games/#{game.rawg_id}/stores?key=#{api_key}"
  response = HTTParty.get(url)
  data = JSON.parse(response.body)
  url_data = data["results"][0]["url"]
  return url_data
end
