class Game < ActiveRecord::Base
  attr_accessible :first_move, :name, :next_player, :player1_id, :player2_id, :total_games, :winner

    has_many :moves
    belongs_to :player1, class_name: 'User'
    belongs_to :player2, class_name: 'User'
    has_one :score 


  #   def initialize

  # @board = [nil, nil, nil, nil, nil, nil, nil, nil, nil]
  # @takensquares = []

  # @winning_moves = [
  #   ['a1','a2', 'a3'],
  #   ['b1', 'b2', 'b3'],
  #   ['c1', 'c2', 'c3'],
  #   ['a1', 'a2', 'a3'],
  #   ['a2', 'b2', 'b2'],
  #   ['a3', 'b3', 'c3'],
  #   ['a1', 'b2', 'c3'],
  #   ['c1', 'b2', 'a3']
  # ]

  # end

  # def player_symbol
  #   @player1 = rand() > 0.5 ? 'X' : 0
  #   @player2 = @player1 == 'X' ? 'O' : 'X'

  #   puts "Player 1 you are #{@player1}"
  #   puts "Player 2 you are #{@player2}"

  #   binding.pry

  #   puts "debug"
  # end

    # if @player1 == 'X'
    #   player1_turn
    # else
    #   player2_turn
    # end


end