class Game < ActiveRecord::Base
  attr_accessible :first_move, :name, :next_player, :player1_id, :player2_id, :total_games, :winner

    has_many :moves
    belongs_to :player1, class_name: 'User'
    belongs_to :player2, class_name: 'User'
    has_one :score 




  # @board = [nil, nil, nil, nil, nil, nil, nil, nil, nil]
  # @takensquares = []

  # @winning_moves  = [
  #     [ 0, 1, 2], 
  #     [ 3, 4, 5], 
  #     [ 6, 7, 8], 
  #     [ 0, 3, 6], 
  #     [ 1, 4, 7], 
  #     [ 2, 5, 8], 
  #     [ 0, 4, 8], 
  #     [ 6, 4, 2]]

  # end

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
        board[move.cell_chosen] = "O"
      end
    end
      board
  end

   
   

   


end