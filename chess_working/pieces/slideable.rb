module Slideable
  HORIZONTAL_AND_VERTICAL_DIRS = [
    [1, 0],
    [0, 1],
    [-1, 0],
    [0, -1]
  ]

  DIAGONAL_DIRS = [
    [1, -1],
    [1, 1],
    [-1, 1],
    [-1, -1]
  ]

  def horizontal_and_vertical_dirs
    HORIZONTAL_AND_VERTICAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def moves
    possible_moves = []

    move_diffs.each do |move_dir|
      dx, dy = move_dir
      possible_moves << grow_unblocked_moves_in_dir(dx, dy)
    end

    possible_moves
  end

  private
  def move_dirs
    raise 'overwritten by subclass'
  end

  def grow_unblocked_moves_in_dir(dx, dy)
    new_pos = [dx + self.position[0], dy + self.position[1]]
    directional_moves = []
    while self.board.valid_pos?(self.color, new_pos)
      
    end
    
  end

end