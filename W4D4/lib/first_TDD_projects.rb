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

end