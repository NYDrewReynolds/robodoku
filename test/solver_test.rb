require 'minitest/pride'
require 'minitest/autorun'
require './lib/solver'

class SolverTest < Minitest::Test

  def setup
    @puzzle = Solver.new(File.read("./puzzles/easy_sample.txt").gsub("\n", "").gsub(" ", "0").chars)
  end

  def test_it_exists
    assert Solver
  end

  def test_it_can_contain_characters
    assert_equal ["026594317", "715638942", "394721865", "163459278", "948267153", "257813694", "531942786", "482176539", "679385421"], @puzzle.board.rows.map { |row| row.spots.map { |spot| spot.value } }.map { |ele| ele.join }
  end

end
