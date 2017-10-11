require 'singleton'
require 'byebug'

module SlidingPiece

  def moves
    dirs = self.move_dirs
    all_moves = []
    dirs.each do |dir|
      #debugger
      curr_moves = self.pos.dup
        while (curr_moves.first).between?(0, 7) && (curr_moves.last).between?(0, 7)
          x, y = curr_moves
          a, b = dir
          curr_pos = [x+a, y+b]
          all_moves << curr_pos
          curr_moves = curr_pos
        end
      end
      all_moves
    end

end

module SteppingPiece
  def moves

  end
end

class Piece

  attr_accessor :pos, :color, :symbol

  def initialize(pos=[], color=nil, symbol=" ")
    @pos = pos
    @color = color
    @symbol = symbol
  end

  def valid_moves #(next_pos, board)
    self.moves
  end

  def to_s()
  end

  def empty?()
  end

  def move_into_check(to_pos)
  end

end

class Queen < Piece

  include SlidingPiece

  def initialize(pos, color, symbol="♕")
    super(pos, color, symbol)

  end

  def move_dirs
    dirs = (-1..1).to_a.permutation(2).to_a
    dirs << [1,1] << [-1, -1]
  end
end

class Knight < Piece

  include SteppingPiece

  def initialize(pos, color, symbol="♘")
    super(pos, color, symbol)

  end

  def move_diffs
    dirs = []
    (-2..2).each do |x|
      (-2..2).each do |y|
        next if x.abs == y.abs || x == 0 || y == 0
        dirs << [x, y]
      end
    end
    dirs
  end

end

class Bishop < Piece

  include SlidingPiece

  def initialize(pos, color, symbol="♗")
    super(pos, color, symbol)
  end

  def move_dirs
    dirs = [-1, 1].permutation(2).to_a
    dirs << [1,1] << [-1, -1]
  end
end

class Pawn < Piece

  def initialize(pos, color, symbol="♙")
    super(pos, color, symbol)
  end
end

class King < Piece

  include SteppingPiece

  def initialize(pos, color, symbol="♔")
    super(pos, color, symbol)
  end

  def move_diffs
    [1, -1, 0, 0, 1, -1].combination(2).to_a.uniq
  end

end

class Rook < Piece

  include SlidingPiece

  def initialize(pos, color, symbol="♖")
    super(pos, color, symbol)
  end

  def move_dirs
    (-1..1).to_a.permutation(2).to_a.uniq.select{|el|el.include?(0)}
  end

end


class NullPiece < Piece

  attr_accessor :pos

  include Singleton

  def initialize
    super
  end

end
