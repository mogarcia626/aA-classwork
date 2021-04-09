def my_uniq(arr)
    new_arr = [] 
    arr.each do |ele|
        new_arr << ele unless new_arr.include?(ele)
    end
    new_arr
end


class Array

    def two_sum
        result = []
        self.each_with_index do |num1, idx1|
            self.each_with_index do |num2, idx2|
                if idx2 > idx1 && num1 + num2 == 0
                    result << [idx1, idx2]
                end
            end
        end
        result
    end


    def my_transpose
        transposed = Array.new(self[0].length) {Array.new(self.length)}
        self.each_with_index do |row, idx1|
            row.each_with_index do |ele, idx2|
                transposed[idx2][idx1] = ele   
            end
        end
        transposed
    end

end


def stock_picker(arr)
    l = arr.length 
    pair = []
    max = 0 
    (0...l).each do |i|
        ((i + 1)...l).each do |j|
            profit = arr[j] - arr[i] 
            if profit > max
                pair = [i, j] 
                max = profit 
            end
        end
    end
    pair  
end


# 3 sub-arrays  

class Game   #create an array length # of stacks # of pieces 

    def initialize(num_stacks, num_pieces)
        #@stacks  2D array of stacks
        #@num of pieces
        # set_up_game 
    end

    def set_up_game 
        # create stacks and populate first stack with pieces 
        # 
    end
    
    def get_move 
        # gets move and verifies 
        # take_piece
        # drop_piece 
        # return a position or an error prompt user for another position request 

    end

    def make_move 
        # execute move 
    end

    def inspect 
        @index 
    end

    def won?

    end
    
end

class Column

    attr_reader :index 

    def initialize(index)
        @stack = [] 
        @index = index 
    end

    def take_piece 
        # pull from top 
        # ensure stack is not empty 
        # self[i] = new_move 
        # should return the piece that was taken 
    end

    def drop_piece(piece)
        # add to top
        # ensure value is a piece is lower than piece inside of stack 
    end

end



class Piece

    def initialize(value)
        @value = value
    end

    def inspect 
        @value 
    end

end



# stack   stack   stack   


