require_relative 'bridge'
require 'byebug'

class Board
  attr_reader :rows
  def initialize
    @sentinel = NullPiece.instance
    populate

  end


  def [](pos) 
    raise "invalid position" unless valid_pos?(pos)
    row, col = pos
    @rows[row][col]
  end

  def []=(pos, val)
    raise "invalid position" unless valid_pos?(pos)
    row, col = pos
    @rows[row][col] = val
  end

  def move_piece!(start_pos, end_pos) 
    raise 'start position does not exist' unless valid_pos?(start_pos)
    raise 'end position does not exist' unless valid_pos?(end_pos)
    self[end_pos] = self[start_pos]
    self[start_pos] = @sentinel
  end
  
  # def move_piece(start_pos, end_pos)

  # end

  def valid_pos?(pos)
   pos.all?{ |i| i < 8 && i >= 0 }
  end

  def add_piece(piece, pos)
    self[pos] = piece
  end

  # def checkmate?(color)

  # end

  # def in_check?(color)

  # end

  # def find_king(color)

  # end

  # def pieces

  # end

  # def dup

  # end

  private
  attr_reader :sentinel

  def fill_back_row(color, row, row_val)
    positioning = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
    (0..7).each {|i| positioning[i].new(color, self, [row_val, i])}
  end

  def fill_front_row(color, row, row_val)
    (0..7).each {|i| Pawn.new(color, self, [row_val, i])}
  end

  def populate
    @rows = Array.new(8){ Array.new(8, sentinel) }
    @rows.each.with_index do |row, i|
      case i
      when 0
        fill_back_row(:white, row, i)
      when 1
        fill_front_row(:white, row, i)
      when 6
        fill_front_row(:black, row, i)
      when 7
        fill_back_row(:black, row, i)
      end
    end
  end
end

if $PROGRAM_NAME == __FILE__
  board = Board.new
  p board

  
end