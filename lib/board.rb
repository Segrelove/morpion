require 'terminal-table'
require 'tty-prompt'
require 'pry'
require 'game'
require 'application'

# The board class is a model that care about our table game. 
# The class initialize the table game and thabks to the player choice will update the table game round after round.

class Board
  attr_accessor :case_name

  @@count = 0
  @@winner_x = []
  @@winner_o = []
  def initialize
    @cases = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  # This def ask one player after one what they want to play.
  def choice
    #
    # JOUEUR 1
    #
    ouech = @cases.map {|x| Integer(x) rescue nil }.compact
    puts "Quel choix souhaites-tu, joueur 1?"
    puts "Tes choix : #{ouech}"
    @choice1 = gets.chomp.to_i
    @result1 = @choice1 - 1     # We store the index of the case the player choose
    @@winner_x << @choice1      # We store all the case the player pick up to check later if he had one of the eight winning combination inside his array
    @cases[@result1] = "xXx"    # We change the value of our @case index to display a new table with the choice of the player !   
    @cases.map { |x| x == @result1 ? 'xXx' : x }
    @rows[@result1] = "xXx"
    if check_if_won(@@winner_x)     # Thanks to the winning array we are chacking if the player win
      puts "Joueur 1 a gagné !"
      display_board
      Application.new.perform       # if the game is finish because he win, we start back to the router to ask if the player want to start a new game
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
      puts "Joueur 2 a gagné !"
      Application.new.perform
    end 
    
  end

  # this def is use to start a table. Then when a player choose a case, it will automaticly udpate thanks to the case[index]
  
  def update_board 
    @rows = []
    @rows << [@cases[0], @cases[1], @cases[2]]
    @rows << [@cases[3], @cases[4], @cases[5]]
    @rows << [@cases[6], @cases[7], @cases[8]]
    @table = Terminal::Table.new :rows => @rows
    puts @table
    if @@count < 4
      puts "Tour n°#{@@count}"
      choice
      update_board
    end
  end
  
  # the winning def checking. We list all the eight possible combination into an array and we compare it with the array of the player choice to see if their is a match ! 
  
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
