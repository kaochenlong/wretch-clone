module Solutionable
  def solution_price(s)
    solutions = {pro: 10, premium: 50}
    solutions[s.to_sym]
  end
end
