class WishgamesController < ApplicationController

  before_action :authenticate_user! # S'assurer que l'utilisateur est authentifié

  def index
    # Récupère tous les jeux dans la wishlist de l'utilisateur connecté
    @wishgames = Wishgame.where(auth0_user_id: session[:user_info]["sub"])
  end

  def create
    # Récupère le jeu sélectionné et l'utilisateur connecté
    game = Game.find(params[:game_id])
    auth0_user_id = session[:user_info]["sub"]

    # Crée une nouvelle entrée dans la table Wishgames
    @wishgame = Wishgame.new(game: game, auth0_user_id: auth0_user_id)

    if @wishgame.save
      redirect_to games_path, notice: "Jeu ajouté à votre liste de souhaits."
    else
      redirect_to games_path, alert: "Erreur lors de l'ajout du jeu."
    end
  end

  def destroy
    # Récupère le jeu de la wishlist de l'utilisateur
    @wishgame = Wishgame.find(params[:id])
    @wishgame.destroy
    redirect_to wishgames_path, notice: 'Jeu retiré de votre liste de souhaits.'
  end

  private

  def wishgame_params
    params.require(:wishgame).permit(:game_id)
  end
end
