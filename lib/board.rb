require 'terminal-table'

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
    @cases = [@A1, @A2, @A3, @B1, @B2, @B3, @C1, @C2, @C3]
  end

  def display_board
    rows = []
    rows << [@cases[0].case_name, @cases[1].case_name, @cases[2].case_name]
    rows << [@cases[3].case_name, @cases[4].case_name, @cases[5].case_name]
    rows << [@cases[6].case_name, @cases[7].case_name, @cases[8].case_name]
    table = Terminal::Table.new :rows => rows
    puts table
    @rows = rows
  end

  def update_board 
    i = 0
    while i < 8 
      puts "Quel choix souhaites-tu, joueur 1?"
      choice1 = gets.chomp.to_i
      result1 = choice1 - 1
      @cases[result1] = "X"
      p @cases
      p @cases[result1].case_name
      # display_board
      puts "Quel choix souhaites-tu, joueur 2?"
      choice2 = gets.chomp.to_i
      result2 = choice2 - 1
      @cases[result2] = "O"
      p @cases
      # display_board
      i += 1
    end
  end
end