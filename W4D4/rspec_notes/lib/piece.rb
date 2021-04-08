require 'byebug'


class Piece 
  attr_reader :color
  attr_accessor :pos

  def initialize(color, pos, board)
    raise 'invalid color' unless [:white, :black].include?(color)
    
    raise 'invalid pos' unless board.valid_pos?(pos)

    @color = color 
    @pos = pos
    @board = board
  end

  def symbol 
    raise NotImplementedError
  end

  def empty? 
    return false
  end

  def to_s 
    "#{symbol}"
  end
end