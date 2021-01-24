require 'pry'

class Game

    attr_accessor :board, :player_1, :player_2, :input

    WIN_COMBINATIONS = [
                        [0, 1, 2], 
                        [0, 3 ,6],
                        [0, 4, 8],
                        [1, 4, 7],
                        [2, 5, 8], 
                        [2, 4, 6],   
                        [3, 4, 5], 
                        [6, 7, 8]
    ]

   def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new )

                @player_1 = player_1
                @player_2 = player_2
                @board = board
   end

   def current_player
        board.turn_count % 2 == 0 ? @player_1 : @player_2
        #player 1 starts with the odd counting , player 2 is the second - even
        #in this method i am asking if the board count can be divided by 2 with a remainder of zero
        # it means that it is player 1 turn - because if the count is 2 then 3th will be player 1
        #if the count is 6 then the 7th move will be player 1 
   end

   def won?
        WIN_COMBINATIONS.find do |combination|
            board.cells[combination[0]] == board.cells[combination[1]] &&
            board.cells[combination[1]] == board.cells[combination[2]] &&
            board.cells[combination[0]] != " "
           
        end
   end

   def draw?
       @board.full? && !won? 
   end

   def over?
        won? || draw?
   end

   def winner
        if combination = won?
            board.cells[combination[2]]
     
        end
   end

   def turn
        puts "Please enter a number 1-9:"
        input = current_player.move(@board)
        if @board.valid_move?(input)
            @board.update(input, current_player)
        else
            turn
        end
        @board.display
   end

    def play
    turn until over?
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
     end
    end






end