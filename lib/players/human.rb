require 'pry'
module Players
    class Human < Player

        def move(board)
            
            puts "please enter your selection"
            gets.strip
        end




    end
end