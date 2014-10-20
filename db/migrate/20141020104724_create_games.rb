class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :player1_id
      t.integer :player2_id
      t.integer :total_games
      t.string :name
      t.integer :first_move
      t.integer :next_player
      t.integer :winner

      t.timestamps
    end
  end
end
