require 'player'
require 'board'
require 'boardcase'
require 'show'

class Game
  def initialize 
    # @show = Show.new
    # @board = Board.new
    # @boardcase = BoardCase.new
  end

  def create_game
    params_player_one = Show.new.create_player
    player_one = Player.new(params_player_one)
    player_one.save

    params_player_two = Show.new.create_player
    player_two = Player.new(params_player_two)
    player_two.save
    # launch_board
  end

  # def launch_board
  #   @board = Board.new
  # end
end