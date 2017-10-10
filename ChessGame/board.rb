require_relative "piece"

class Board

  attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new(8)}
    make_starting_grid
  end

  def make_starting_grid

    null = NullPiece.instance

    (0..7).each do |row|
      (0..7).each do |col|
        color = "Black" if row <= 1
        color = "White" if row >= 6
        if row.between?(2, 5)
          self[[row, col]] = null
        elsif row == 1 || row == 6
          self[[row, col]] = Pawn.new([row, col], color)
        else #row  == 0 || 7
          idx = [row, col]
          case col
          when 0, 7
            self[idx] = Rook.new(idx, color)
          when 1, 6
            self[idx] = Knight.new(idx, color)
          when 2, 5
            self[idx] = Bishop.new(idx, color)
          when 3
            self[idx] = Queen.new(idx, color)
          when 4
            self[idx] = King.new(idx, color)
          end
        end
      end
    end
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, piece)
    x, y = pos
    @grid[x][y] = piece
  end

  def dup
    @grid.dup
  end

  def move_piece(from_pos, to_pos)
    #throw exception if
    # there is no piece at start_pos or
    # the piece cannot move to end_pos.
  end

  def move_piece!(from_pos, to_pos)
  end

end

board = Board.new
p board.grid
