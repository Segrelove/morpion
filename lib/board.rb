require 'terminal-table'
require 'tty-prompt'
require 'pry'
require 'game'
require 'application'

class Board
  attr_accessor :case_name

  @@count = 0
  @@winner_x = []
  @@winner_o = []
  def initialize
    @cases = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def choice
    #
    # JOUEUR 1
    #
    ouech = @cases.map {|x| Integer(x) rescue nil }.compact
    puts "Quel choix souhaites-tu, joueur 1?"
    puts "Tes choix : #{ouech}"
    @choice1 = gets.chomp.to_i
    @result1 = @choice1 - 1
    @@winner_x << @choice1
    @cases[@result1] = "xXx"
    @cases.map { |x| x == @result1 ? 'xXx' : x }
    @rows[@result1] = "xXx"
    if check_if_won(@@winner_x)
      puts "XxX a gagné !"
      Application.new.perform
    end 
    #
    # JOUEUR 2
    #
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
    if check_if_won(@@winner_o)
      puts "oOo a gagné !"
      Application.new.perform
    end 
    
  end

  def update_board 
    @rows = []
    @rows << [@cases[0], @cases[1], @cases[2]]
    @rows << [@cases[3], @cases[4], @cases[5]]
    @rows << [@cases[6], @cases[7], @cases[8]]
    @table = Terminal::Table.new :rows => @rows
    puts @table
    if @@count < 5
      puts "Tour n°#{@@count}"
      choice
      puts "sortie boucle choice"
      update_board
      puts "sortie boucle update_board"

    end
  end
  
  def check_if_won(round)
    # rounds est l'array des tours joués par les deux joueurs
    winning_combinations = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9],
      [1, 4, 7],
      [2, 5, 8],
      [3, 6, 9],
      [1, 5, 9],
      [3, 5, 7],
    ]
  
    # Est-ce que les trois éléments d'une des combinaisons gagnantes se retrouve dans l'array?
    winning_combinations.each do |winning|
      test = false
      if round.include?(winning[0]) && round.include?(winning[1]) && round.include?(winning[2])
        test = true
      end
      return test
    end
  end
end