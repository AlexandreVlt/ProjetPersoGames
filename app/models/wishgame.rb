class Wishgame < ApplicationRecord
  has_many :games
  belongs_to :user
  validates :auth0_user_id, presence: true
  validates :game_id, presence: true
end
