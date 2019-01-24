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