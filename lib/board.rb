require 'pry'

class Board

    attr_accessor :cells

    def initialize
    #    @cells =[]
       reset!
    end

    def reset!
      @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def display
     
            puts  " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
            puts  "-----------"
            puts  " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
            puts  "-----------"
            puts  " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end

    def position(user_move)
        i = user_move.to_i - 1
        @cells[i]
    end
    
    def full?
        if @cells.include?(" ")
            false
        else
            true
        end
    end

    def turn_count
        @cells.select {|cell| cell != " "}.count
    end

    def taken?(i)
        i = i.to_i - 1
        if @cells[i] != " "
            true
        else
            false
        end
    end

    def valid_move?(input)
        input = input.to_i
        if input < 1 && input < 9
            false
        elsif taken?(input) == true
            false
        else
            true
        end
    end

    def update(input, player)
        input = input.to_i
        @cells[input - 1] = player.token

    end



end