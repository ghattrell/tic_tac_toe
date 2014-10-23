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
    @board = Array.new(9)
    self.moves.each do |move|
      if move.player_id == self.player1_id
        @board[move.cell_chosen] = "X"
      else
        @board[move.cell_chosen] = "0"
      end
    end
      @board
  end

  def player_has_won?(current_moves_array)
      @winning_moves  = [[ 0, 1, 2], [ 3, 4, 5], [ 6, 7, 8], [ 0, 3, 6], [ 1, 4, 7], [ 2, 5, 8], [ 0, 4, 8], [ 6, 4, 2]].to_set
      @winning_moves.any? {|subset| current_moves_array.superset? subset.to_set}
  end

  def computer_has_won?(computer_moves_array)
    @winning_moves  = [[ 0, 1, 2], [ 3, 4, 5], [ 6, 7, 8], [ 0, 3, 6], [ 1, 4, 7], [ 2, 5, 8], [ 0, 4, 8], [ 6, 4, 2]].to_set
    @winning_moves.any? {|subset| computer_moves_array.superset? subset.to_set}
  end




  def draw?
   self.moves.count == 9
  end

  def last_player?
    last_move = self.moves.last
    return false if last_move.nil?
    last_move.player_id
  end


  def can_move?(next_player)
    last_move = self.moves.last
    return true if last_move.nil?
    next_player.id != last_move.player_id
  end

  def computer_has_to_move?
    self.player2_id == 1
  end


  def is_tile_free?
  end

  # def build_board_with_computer
  #   board = Array.new(9)
  #   self.moves.each do |move|
  #     if move.player_id == self.player1_id
  #       board[move.cell_chosen] = "X"
  #       board[] 

  # @board.each_with_index.do |move, index|
  #   if move.nil?
  #     @index = index

  # def computer_makes_move
  #   # if self.player1_id == self.moves.last.player_id
  #   index = [0, 1, 2, 3, 4, 5, 6, 7, 8]
  #   number = index.sample
  #   index.delete(number)
  #   @board = self.build_board
  #     if @board[number] != nil
  #       Move.create!(player_id: User.first.id, game_id: self.id, cell_chosen: number)
  #     else
  #       computer_makes_move
  #     end
  # end

  def computer_makes_move
      index = [0, 1, 2, 3, 4, 5, 6, 7, 8]
      number = index.sample
      @board = self.build_board
        if @board[number] == nil
          Move.create!(player_id: User.first.id, game_id: self.id, cell_chosen: number)
        else
          computer_makes_move
        end
  end


















   

   


end