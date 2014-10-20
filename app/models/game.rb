class Game < ActiveRecord::Base
  attr_accessible :first_move, :name, :next_player, :player1_id, :player2_id, :total_games, :winner

    has_many :moves
    belongs_to :player1, class_name: 'User'
    belongs_to :player2, class_name: 'User'
    has_one :score 
end
