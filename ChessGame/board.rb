require_relative "piece"

class Board

  attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) { NullPiece.instance }}
    make_starting_grid
  end

  def make_starting_grid

    (0..7).each do |row|
      (0..7).each do |col|
        color = "Black" if row <= 1
        color = "White" if row >= 6
        if row == 1 || row == 6
          self[[row, col]] = Pawn.new([row, col], color)
        elsif row == 0 || row == 7
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

  def in_bounds(pos)
    x, y = pos
    x.between?(0, 7) && y.between?(0, 7)
  end

  def move_piece(from_pos, to_pos)
    #throw exception if
    # there is no piece at start_pos or
    # the piece cannot move to end_pos
    raise "There is no piece at your chosen position." if self[from_pos].class == NullPiece
    #raise "You can't move there." if !self[to_pos].valid_moves
    self[to_pos], self[from_pos] = self[from_pos], self[to_pos]

    self[to_pos].valid_moves(self)
  end

  def move_piece!(from_pos, to_pos)
  end

end

# p game = Board.new
# # p board[[0,0]].symbol
# # p board[[1,1]].symbol
# # p board.move_piece([0,0], [1,1])
# p game.grid
# # p board[[0,0]].symbol
# # p board[[1,1]].symbol
