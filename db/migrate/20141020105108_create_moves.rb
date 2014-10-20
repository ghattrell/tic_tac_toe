class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.integer :player_id
      t.string :symbol
      t.string :cell_chosen

      t.timestamps
    end
  end
end
