class Game < ActiveRecord::Base
  attr_accessible :first_move, :name, :next_player, :player1_id, :player2_id, :total_games, :winner

    has_many :moves
    belongs_to :player1, class_name: 'User'
    belongs_to :player2, class_name: 'User'
    has_one :score 




  # @board = [nil, nil, nil, nil, nil, nil, nil, nil, nil]
  # @takensquares = []

  

  # def player_symbol
  #   @player1_symbol = rand() > 0.5 ? 'X' : 0
  #   @player2_symbol = @player1_symbol == 'X' ? 'O' : 'X'
  #   if @player1_symbol == 'X'
  #     player1_turn
  #   else
  #     player2_turn
  #   end
  # end

  # def player1_turn
  #   @move

  def build_board
    board = Array.new(9)
    self.moves.each do |move|
      if move.player_id == self.player1_id
        board[move.cell_chosen] = "X"
      else
        board[move.cell_chosen] = "0"
      end
    end
      board
  end

  def player_has_won?(current_moves_array)
      @winning_moves  = [[ 0, 1, 2], [ 3, 4, 5], [ 6, 7, 8], [ 0, 3, 6], [ 1, 4, 7], [ 2, 5, 8], [ 0, 4, 8], [ 6, 4, 2]].to_set
      @winning_moves.any? {|subset| current_moves_array.superset? subset.to_set}
  end



  def draw?
    if self.moves == 9
    end
  end

  def your_turn?(last_turn_id)  
    currentuser.id == last_turn_id
  end





   

   


end