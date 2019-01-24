require "player"
require "board"
require "boardcase"
require "show"

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
    @board.display_board
    update_game
  end

  ## ROUND
  def update_game
    @board.update_board
  end
end

testrounds_win = ["A1", "B3", "C2", "A2", "B2", "A3"]
testrounds_not = ["A1", "B3", "C2", "A2", "B2", "C1"]

def check_if_won(rounds)
  # rounds est l'array des tours joués par les deux joueurs
  winning_combinations = [
    ["A1", "A2", "A3"],
    ["B1", "B2", "B3"],
    ["C1", "C2", "A3"],
    ["A1", "B1", "C1"],
    ["A2", "B2", "C2"],
    ["A3", "B3", "C3"],
    ["A1", "B2", "C3"],
    ["A3", "B2", "C1"],
  ]

  # Est-ce que les trois éléments d'une des combinaisons gagnantes se retrouve dans l'array?
  winning_combinations.each do |winning|
    test = false
    if testround.include?(winning[0]) && testround.include?(winning[1]) && testround.include?(winning[2])
      test = true
    end
    return test
  end
end

puts check_if_won(testrounds_win)
