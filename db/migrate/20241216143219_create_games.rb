class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.string :name
      t.date :released
      t.string :background_image
      t.decimal :rating
      t.string :genre

      t.timestamps
    end
  end
end
