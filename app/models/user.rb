class User < ActiveRecord::Base
  attr_accessible :draws, :email, :first_name, :image, :last_name, :losses, :password_digest, :win_percentage, :wins

  has_many :games_as_player1, foreign_key: :player1_id, class_name: 'Game'
  has_many :games_as_player2, foreign_key: :player2_id, class_name: 'Game'
  
end
