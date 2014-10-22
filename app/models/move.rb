class Move < ActiveRecord::Base
  attr_accessible :cell_chosen, :player_id, :symbol, :game_id

  belongs_to :game
  belongs_to :user

  
