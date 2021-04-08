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