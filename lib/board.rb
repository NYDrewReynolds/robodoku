require_relative 'spot'
require_relative 'row'
require_relative 'column'
require_relative 'square'

class Board
  attr_reader :spots,
              :rows,
              :columns,
              :squares

  def initialize(values)
    @spots = values.map { |value| Spot.new(value.to_i) }
    @rows = spots.each_slice(9).map { |slice| Row.new(slice) }
    @columns = spots.each_slice(9).to_a.transpose.map { |slice| Column.new(slice) }
    @squares = spots.each_slice(9).each_slice(3).flat_map { |arr| arr.transpose.flatten }.each_slice(9).map { |slice| Square.new(slice) }
  end

  def solved?
    spots.all? { |spot| spot.solved? }
  end

  def evaluate
    @rows.each { |row| row.solve_row }
    @columns.each { |column| column.solve_column }
    @squares.each { |square| square.solve_square }
  end

end
