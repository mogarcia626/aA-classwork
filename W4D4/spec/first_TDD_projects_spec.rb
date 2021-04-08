require 'first_TDD_projects'


describe "#my_uniq" do

    # let(:arr) {[1, 2, 1, 3, 3]}

    it "ensure all elements are unique" do
            # arr = [1, 2, 1, 3, 3]
            expect(my_uniq([1, 2, 1, 3, 3]).to eq([1, 2, 3]))
    end
end


