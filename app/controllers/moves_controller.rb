class MovesController < ApplicationController
  # GET /moves
  # GET /moves.json
  def index
    @moves = Move.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @moves }
    end
  end

  # GET /moves/1
  # GET /moves/1.json
  def show
    @move = Move.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @move }
    end
  end

  # GET /moves/new
  # GET /moves/new.json
  def new
    @move = Move.create!(cell_chosen: params[:cell_chosen].to_i, player_id: current_user.id, game_id: params[:game_id])
    @game = Game.find params[:game_id]
    last_move_id = Move.last.player_id
    current_moves_array = (@game.moves.where(player_id: current_user.id).pluck(:cell_chosen)).to_set
    if @game.player_has_won?(current_moves_array)
      #Ternary operator to decide loser
      loser = @game.player1_id == current_user.id ? @game.player2_id : @game.player1_id
      score = Score.create!(game_id: params[:game_id], winner_id: current_user.id, loser_id: loser, draw: nil)
      flash[:notice] = "Winner Winner Chicken Dinner"
      redirect_to @game
    elsif @game.draw?
      flash[:notice] = "Game was a draw try again"
      score = Score.create!(game_id: params[:game_id], winner_id: nil, loser_id: nil, draw: 1)
      redirect_to @game
    else 
      redirect_to @game
    end
    
    


    #Check won
    #Check draw
    #If neither redirect_to @game
    # redirect_to @game

    #   respond_to do |format|
    #   format.html # new.html.erb
    #   format.json { render json: @move }
    # end
  end
  

  # GET /moves/1/edit
  # def edit
  #   @move = Move.find(params[:id])
  # end

  # POST /moves
  # POST /moves.json
  def create
    @move = Move.new(params[:move])

    respond_to do |format|
      if @move.save
        format.html { redirect_to @move, notice: 'Move was successfully created.' }
        format.json { render json: @move, status: :created, location: @move }
      else
        format.html { render action: "new" }
        format.json { render json: @move.errors, status: :unprocessable_entity }
      end
    end
  end



  # PUT /moves/1
  # PUT /moves/1.json
  def update
    @move = Move.find(params[:id])

    respond_to do |format|
      if @move.update_attributes(params[:move])
        format.html { redirect_to new_game_move, notice: 'Move was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @move.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moves/1
  # DELETE /moves/1.json
  # def destroy
  #   @move = Move.find(params[:id])
  #   @move.destroy

  #   respond_to do |format|
  #     format.html { redirect_to moves_url }
  #     format.json { head :no_content }
  #   end
  # end
end


