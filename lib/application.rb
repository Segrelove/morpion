
require 'game'
require 'tty-prompt'

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