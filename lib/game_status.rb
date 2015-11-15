# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
]

def won?(board)
  WIN_COMBINATIONS.select do |combo|
    if combo.all? { |position| board[position] == 'X' }
      combo
    elsif combo.all? { |position| board[position] == 'O' }
      combo
    end
  end.first
end

def full?(board)
  board.none? { |space| space == ' ' } ? true : false
end

def draw?(board)
  if won?(board)
    false
  elsif full?(board)
    true
  end
end

def over?(board)
  won?(board) || draw?(board) ? true : false
end

def winner(board)
  won?(board) ? board[won?(board).first] : nil
end
