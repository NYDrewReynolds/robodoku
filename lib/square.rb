require_relative 'spot'

class Square
  attr_reader :spots,
              :undecided_spots

  def initialize(spots)
    @spots = spots
  end

  def undecided_spots
    @spots.reject { |spot| spot.solved? }
  end

  def solve_square
    spots.each do |spot|
      if spot.solved?
        undecided_spots.each { |spt| spt.remove_possibility(spot.value) }
      end
    end
  end

end
