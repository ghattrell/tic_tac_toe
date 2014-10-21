class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.integer :player_id
      t.string :symbol
      t.integer :cell_chosen
      t.integer :game_id

      t.timestamps
    end
  end
end
