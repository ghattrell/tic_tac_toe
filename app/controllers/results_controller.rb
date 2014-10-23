class ResultsController < ApplicationController

  def win
    render "results/win"
  end

  def loss
    render "results/loss"
  end

  def draw
    render "results/draw"
  end

end