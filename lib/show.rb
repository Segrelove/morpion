class Show
  def create_player
    puts "Quel est ton nom?"
    name = gets.chomp
    params = {name: name}
  end
end