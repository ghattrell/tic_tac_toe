class Move < ActiveRecord::Base
  attr_accessible :cell_chosen, :player_id, :symbol

  belongs_to :game
  belongs_to :user
end
