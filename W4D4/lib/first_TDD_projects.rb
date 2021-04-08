def my_uniq(arr)
    new_arr = [] 
    arr.each do |ele|
        new_arr << ele unless new_arr.include?(ele)
    end
    new_arr
end

# p my_uniq([1, 2, 1, 3, 3])