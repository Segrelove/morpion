require 'terminal-table'
require 'tty-prompt'
require 'pry'

class Board
  attr_accessor :case_name

  @@count = 0
  @@winner_x = []
  @@winner_o = []
  def initialize
    @cases = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def choice
    ouech = @cases.map {|x| Integer(x) rescue nil }.compact
    puts "Quel choix souhaites-tu, joueur 1?"
    puts "Tes choix : #{ouech}"
    @choice1 = gets.chomp.to_i
    @result1 = @choice1 - 1
    @@winner_x << @choice1
    @cases[@result1] = "xXx"
    @cases.map { |x| x == @result1 ? 'xXx' : x }
    @rows[@result1] = "xXx"

    ouech = @cases.map {|x| Integer(x) rescue nil }.compact
    puts "Quel choix souhaites-tu, joueur 2?"
    puts "Tes choix : #{ouech}"
    @choice2 = gets.chomp.to_i
    @result2 = @choice2 - 1
    @cases[@result2] = "oOo"
    @@winner_o << @choice2
    @cases[@result2]
    @cases.map { |x| x == @result2 ? 'oOo' : x }
    @rows[@result2] = "oOo"
    @@count = @@count + 1
  end

  def update_board 
    @rows = []
    @rows << [@cases[0], @cases[1], @cases[2]]
    @rows << [@cases[3], @cases[4], @cases[5]]
    @rows << [@cases[6], @cases[7], @cases[8]]
    @table = Terminal::Table.new :rows => @rows
    puts @table
    if @@count < 3
      puts "Tour n°#{@@count}"
      choice
      update_board
    end
  end
end