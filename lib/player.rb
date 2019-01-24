require 'game'

class Player
  attr_reader :name
  
  def initialize(name)
    @name = name
  end

  def save
    CSV.open('./db/player.csv', 'a') do |csv|
      csv << [@name]
    end
  end

end