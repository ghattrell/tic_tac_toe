class User < ActiveRecord::Base
  attr_accessible :draws, :email, :first_name, :image, :last_name, :losses, :password, :password_confirmation, :win_percentage, :wins

  mount_uploader :image, ImageUploader

  has_secure_password

   validates :password, presence: true, on: :create
   validates :email, presence: true
   validates :email, uniqueness: { case_sensitive: false }

  has_many :games_as_player1, foreign_key: :player1_id, class_name: 'Game'
  has_many :games_as_player2, foreign_key: :player2_id, class_name: 'Game'


  def games
    [self.games_as_player2, self.games_as_player1].flatten
  end 

  def win_percentage
    games_won_by_user = self.games.select{ |game| game.score && game.score.winner_id == self.id }.count
    games_played_by_user = self.games.count
    (games_won_by_user.to_f / games_played_by_user.to_f) * 100
  end

end
