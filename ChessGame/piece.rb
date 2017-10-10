require 'singleton'

class Piece

  attr_accessor :pos, :color, :symbol

  def initialize(pos=[], color=nil, symbol="X")
    @pos = pos
    @color = color
    @symbol = symbol
  end
end

class Queen < Piece
  def initialize(pos, color, symbol="Q")
    super(pos, color, symbol)
  end
end

class Knight < Piece
  def initialize(pos, color, symbol="N")
    super(pos, color, symbol)
  end
end

class Bishop < Piece
  def initialize(pos, color, symbol="B")
    super(pos, color, symbol)
  end
end

class Pawn < Piece
  def initialize(pos, color, symbol="P")
    super(pos, color, symbol)
  end
end

class King < Piece
  def initialize(pos, color, symbol="K")
    super(pos, color, symbol)
  end
end

class Rook < Piece
  def initialize(pos, color, symbol="R")
    super(pos, color, symbol)
  end
end


class NullPiece < Piece

  attr_accessor :pos

  include Singleton

  def initialize
    super
  end

end
