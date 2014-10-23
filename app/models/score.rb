class Score < ActiveRecord::Base
  attr_accessible :draw, :loser_id, :winner_id, :game_id

  belongs_to :game

  def  number_of_wins_per_player
    self.group(:winner_id).count.each do |k,v|
      puts "#{User.find(k).first_name} -> #{v} wins" if k.present?
      @wins = v
    end
  end

  

  # def wins_for_each_player
  #   self.group(:winner_id).cou

end

  
