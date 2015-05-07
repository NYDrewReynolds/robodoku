require_relative 'board'

class Solver
  attr_reader :board

  def initialize(values)
    @board = Board.new(values)
  end

  def solve
    until board.solved?
      board.evaluate
    end
    board.spots.map { |spot| spot.value }.each_slice(9) { |slice| puts slice.join}
  end
end
