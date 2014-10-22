class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :game_id
      t.integer :winner_id
      t.integer :loser_id
      t.integer :draw

      t.timestamps
    end
  end
end
