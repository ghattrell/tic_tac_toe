class Score < ActiveRecord::Base
  attr_accessible :draw, :loser_id, :winner_id, :game_id

  belongs_to :game

  def player_wins
    self.group(:winner_id).count.each do |k,v|
      puts "#{User.find(k).first_name} -> #{v} wins" if k.present?
  end
end

  
