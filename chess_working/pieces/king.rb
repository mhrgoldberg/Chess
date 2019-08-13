require_relative 'stepable'
require_relative 'piece'

class King < Piece
  include Stepable

  def symbol
    :king
  end

  def move_diffs
    [
      [1, 0],
      [0, 1],
      [-1, 0],
      [0, -1],
      [1, -1],
      [1, 1],
      [-1, 1],
      [-1, -1]
    ]
  end

end