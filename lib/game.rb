require 'player'
require 'board'
require 'boardcase'
require 'show'

class Game

  @@rounds = 0

  def initialize 
    # @show = Show.new
    @board = Board.new
    # @boardcase = BoardCase.new
  end

  def create_game
    params_player_one = Show.new.create_player_x
    @player_one = Player.new(params_player_one[:name], params_player_one[:type])
    @player_one.save

    params_player_two = Show.new.create_player_o
    @player_two = Player.new(params_player_two[:name], params_player_two[:type])
    @player_two.save
    # @board.display_board
    update_game
  end

  ## ROUND
  def update_game
    @board.update_board
    # @board.display_board
  end
end