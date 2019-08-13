class Piece
  attr_accessor :position
  attr_reader :color, :board
  def initialize(color, board, position)
    # color is a symbol - color of piece or square?
    @color = color
    # board instance
    @board = board
    @position = position
    # adds piece to board
    @board.add_piece(self, position)
  end

  def to_s
    "#{symbol}"
  end

  def empty?
    false
  end

  # def valid_moves

  # end

  def symbol
    raise 'implemented in subclass'
  end

  # def move_into_check?(end_pos)

  # end

  
  
end