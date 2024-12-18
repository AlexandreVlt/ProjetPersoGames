class AddIdRawgTogames < ActiveRecord::Migration[7.1]
  def change
    add_column :games, :rawg_id, :integer
  end
end
