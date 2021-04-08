require 'rspec'
require 'first_TDD_projects'

describe first_TDD_projects do

    describe "#my_uniq" do
        
        it "ensure all elements are unique" do
            arr = [1, 2, 1, 3, 3]
            expect(my_uniq(arr).to eq([1, 2, 3]))
        end
    end
end