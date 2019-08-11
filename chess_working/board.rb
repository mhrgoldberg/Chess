require_relative 'pieces/piece.rb'
require_relative 'pieces/null.rb'
require_relative 'pieces/pawn.rb'
# require_relative 'bridge'
require 'byebug'

class Board

  def self.populate
    board = Array.new(8){ Array.new(8) }
    board.each.with_index do |row, i|
      if [0,1,6,7].include?(i)
        row.map!{|space| Piece.new}
      end
    end
    board
  end
  
  attr_accessor :rows
  def initialize(board = Board.populate)
    @rows = board
  end

  def [](pos) 
    row, col = pos
    @rows[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @rows[row][col] = val
  end

  def move_piece(start_pos, end_pos) 
    raise 'start position does not exist' unless valid_pos?(start_pos) && !self[start_pos].nil?
    raise 'end position does not exist' unless valid_pos?(end_pos) && !self[start_pos].nil?
    self[end_pos] = self[start_pos]
    self[start_pos] = nil
  end
  
  def valid_pos?(pos)
   pos.all?{ |i| i < 7 && i >= 0 }
  end
  
end

if $PROGRAM_NAME == __FILE__
  board = Board.new
  p board
  board.move_piece([0,1], [4,4])
  p board
  
end