module Stepable
  
  def moves
    possible_moves = []

    move_diffs.each do |move_pos|
      new_pos = [move_pos[0] + self.position[0], move_pos[1] + self.position[1]]
      possible_moves << new_pos if self.board.valid_pos?(self.color, new_pos)
    end
    possible_moves
  end

  private
  def move_diffs
    raise 'ovwerwritten by subclass'
  end

end 