
require 'game'
require 'tty-prompt'

# This call is the router that start the game after we run the app.rb programme.
# Basicly it will perform the starting point and send an order to our controller how will manage the rest (he is call "game")

class Application
  def initialize
    @game = Game.new
  end 

  def perform
    puts "Bienvenu sur nos Morpions!"
    while true
      prompt = TTY::Prompt.new
      params = prompt.select("Souhaites-tu démarrer une partie?", %w(Oui Non))
      if params == "Oui"
        puts "C'est partie!"
        @game.create_game
      else
        puts "Ca marche tcho tcho bye"
        exit
      end
    end
  end

  # def round

  # end
end
