# This class create a player and ask his name. 
# The first player will be asign the "X" sticker to play and the second player will be asign the "O" stickers automaticly.

class Show
  def create_player_x
    puts "Quel est le nom du premier joueur?"
    name = gets.chomp
    params = {name: name, type: "x"}
  end
  def create_player_o
    puts "Quel est le nom du deuxième joueur?"
    name = gets.chomp
    params = {name:name, type: "o"}
  end
  def update_player

  end
end
