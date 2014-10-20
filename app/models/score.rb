class Score < ActiveRecord::Base
  attr_accessible :draw, :loser_id, :winner_id

  belongs_to :game 
end
