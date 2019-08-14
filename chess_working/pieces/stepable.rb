module Stepable
  
  def moves
    possible_moves = []
    current_row, current_column = self.position

    move_diffs.each do |move_pos|
      move_row, move_column = move_pos
      new_row = current_row + move_row
      new_column = current_column + move_column
      new_pos = [new_row, new_column]
      possible_moves << new_pos if self.board.valid_pos?(new_pos)
    end
    possible_moves
  end

  private
  def move_diffs
    raise 'ovwerwritten by subclass'
  end

end