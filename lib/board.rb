require 'terminal-table'
require 'tty-prompt'
require 'pry'

class Board
  attr_accessor :case_name

  def initialize
    @A1 = BoardCase.new(1)
    @A2 = BoardCase.new(2)
    @A3 = BoardCase.new(3)
    @B1 = BoardCase.new(4)
    @B2 = BoardCase.new(5)
    @B3 = BoardCase.new(6)
    @C1 = BoardCase.new(7)
    @C2 = BoardCase.new(8)
    @C3 = BoardCase.new(9)
    @cases = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def choice_x
    puts "Quel choix souhaites-tu, joueur 1?"
    @choice1 = gets.chomp.to_i
    @result1 = @choice1 - 1
    @cases[@result1] = "X"
    p @cases[@result1]
    p @cases.map { |x| x == @result1 ? 'X' : x }
    @rows[@result1] = "X"
  end

  def choice_o
    puts "Quel choix souhaites-tu, joueur 2?"
    binding.pry
    @choice2 = gets.chomp.to_i
    @result2 = @choice2 - 1
    @cases[@result2] = "O"
    p @cases[@result2]
    p @cases.map { |x| x == @result2 ? 'O' : x }
    @rows[@result2] = "O"
  end

  def update_board 
    @rows = []
    @rows << [@cases[0], @cases[1], @cases[2]]
    @rows << [@cases[3], @cases[4], @cases[5]]
    @rows << [@cases[6], @cases[7], @cases[8]]
    @table = Terminal::Table.new :rows => @rows
    puts @table
    i = 0
    while i < 1
      choice_x 
      choice_o
      i += 1
    end
    update_board
  end
end