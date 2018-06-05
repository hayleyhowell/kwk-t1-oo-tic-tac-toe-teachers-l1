class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    index = input.to_i - 1
    @board[index]
  end
  
  def move(index, character="X")
    @board[index] = character
  end
  
  def position_taken?(index)
    !(@board[index].nil? || board[index] == " ")
  end
  
  def valid_move?(index)
    index.between?(0,8) && position_taken?(index) == false
  end
  
  def turn
    character = current_player
    puts "Please enter 1-9:"
    input = gets
    index = input_to_index(input)
    if valid_move?(index)
      move(index, character)
    else 
      until valid_move?(index)
        puts "Please enter 1-9:"
        input = gets
        index = input_to_index(input)
      end
      move(index, character)
    end
    display_board
  end


end