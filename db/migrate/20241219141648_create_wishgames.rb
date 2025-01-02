class CreateWishgames < ActiveRecord::Migration[7.1]
  def change
    create_table :wishgames do |t|
      t.references :game, null: false, foreign_key: true
      t.string :auth0_user_id

      t.timestamps
    end
  end
end
