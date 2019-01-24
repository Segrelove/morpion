# We store the name and type of sticker of each player here and inside a csv. 
# The csv is not a real use, unless you want to know who doesn't work and play all the time !!! :D 

class Player
  attr_reader :name, :type
  
  def initialize(name, type)
    @name = name
    @type = type
  end

  def save
    CSV.open('./db/player.csv', 'a') do |csv|
      csv << [@name, @type]
    end
  end

end
