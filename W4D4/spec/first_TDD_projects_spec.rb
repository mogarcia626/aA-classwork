require 'first_TDD_projects'


describe "#my_uniq" do

    let(:arr) {[1, 2, 1, 3, 3]}

    it "ensure all elements are unique" do
        expect(my_uniq(arr)).to eq([1, 2, 3])
    end
end

describe Array do
    let(:arr) {[-1, 0, 2, -2, 1]}

    describe "#two_sum" do
        context 'with valid argument' do
        
            it "should return 2D array index pairs whose elements sum equal to zero" do
                expect(arr.two_sum).to eq( [[0,4], [2,3]])
            end
        end
    end



end


