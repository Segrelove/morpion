
testrounds_win = ["A1", "B3", "C2", "A2", "B2", "A3"]
testrounds_not = ["A1", "B3", "C2", "A2", "B2", "C1"]

def check_if_won(rounds)
  # rounds est l'array des tours joués par les deux joueurs
  winning_combinations = [
    ["A1", "A2", "A3"],
    ["B1", "B2", "B3"],
    ["C1", "C2", "A3"],
    ["A1", "B1", "C1"],
    ["A2", "B2", "C2"],
    ["A3", "B3", "C3"],
    ["A1", "B2", "C3"],
    ["A3", "B2", "C1"],
  ]

  # Est-ce que les trois éléments d'une des combinaisons gagnantes se retrouve dans l'array?
  winning_combinations.each do |winning|
    test = false
    if rounds.include?(winning[0]) && rounds.include?(winning[1]) && rounds.include?(winning[2])
      test = true
    end
    return test
  end
end

puts check_if_won(testrounds_not)
