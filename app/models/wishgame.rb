class Wishgame < ApplicationRecord
  belongs_to :game
  validates :auth0_user_id, presence: true
  validates :game_id, presence: true
end
