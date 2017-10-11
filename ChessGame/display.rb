require_relative 'board'
require 'colorize'
require_relative 'cursor'

class Display

  attr_accessor :board, :cursor

  def initialize
    @board = Board.new
    @cursor = Cursor.new([0, 0], @board)
  end

  def render

    @board.grid.each_with_index do |row, x|
      row.each_with_index do |col, y|
        bgcolor = :white
        if x.even? & y.even?
          bgcolor = :black
        elsif x.odd? & y.odd?
          bgcolor = :black
        end
        if col.pos == @cursor.cursor_pos
          print " #{col.symbol} ".colorize(:background => bgcolor, :color => :red)
        elsif col.color == "White"
          print " #{col.symbol} ".colorize(:background => bgcolor, :color => :yellow)
        elsif col.color == "Black"
          print " #{col.symbol} ".colorize(:background => bgcolor, :color => :blue)
        else
          print " #{col.symbol} ".colorize(:background => bgcolor)
        end
      end
      puts
      # puts "#{symbols.join(" ")}".blue
    end
  end

end

game = Display.new

while true
  game.render
  game.cursor.get_input
  p game.cursor.cursor_pos
end
