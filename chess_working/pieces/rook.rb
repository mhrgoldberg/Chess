require_relative 'slideable'
require_relative 'piece'

class Rook < Piece
  include Slideable

  def symbol
    :rook
  end

  def move_diffs
    horizontal_and_vertical_dirs
  end

end