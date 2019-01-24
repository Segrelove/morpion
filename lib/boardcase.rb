class BoardCase
  # p rows[0][0]
  # p rows[0][1]
  # p rows[0][2]
  # p rows[1][0]
  # p rows[1][1]
  # p rows[1][2]
  # p rows[2][0]
  # p rows[2][1]
  # p rows[2][2]
  attr_reader :case_name
  def initialize(case_name)
    @case_name = case_name
  end


end