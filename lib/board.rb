require 'terminal-table'

class Board
  attr_reader :case_name

  def initialize
    @A1 = BoardCase.new("A1")
    @A2 = BoardCase.new("A2")
    @A3 = BoardCase.new("A3")
    @B1 = BoardCase.new("B1")
    @B2 = BoardCase.new("B2")
    @B3 = BoardCase.new("B3")
    @C1 = BoardCase.new("C1")
    @C2 = BoardCase.new("C2")
    @C3 = BoardCase.new("C3")
  end

  def display_board
    rows = []
    rows << [@A1.case_name, @A2.case_name, @A3.case_name]
    rows << [@B1.case_name, @B2.case_name, @B3.case_name]
    rows << [@C1.case_name, @C2.case_name, @C3.case_name]
    table = Terminal::Table.new :rows => rows
    puts table
    p rows
  end
end