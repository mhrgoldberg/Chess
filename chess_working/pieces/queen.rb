require_relative 'slideable'
require_relative 'piece'

class Queen < Piece
  include Slideable

  def symbol
    :queen
  end

  def move_diffs
    horizontal_and_vertical_dirs.concat(diagonal_dirs)
  end

end