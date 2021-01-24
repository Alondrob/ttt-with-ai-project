require 'pry'
module Players
    class Human < Player

        def move(board)
            
            puts "please enter your selection"
            input = gets.strip
            # index = input.to_i - 1
        end




    end
end