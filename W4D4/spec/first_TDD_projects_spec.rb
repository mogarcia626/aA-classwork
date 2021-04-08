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

    let(:row) {[[0, 1, 2], [3, 4, 5], [6, 7, 8]]}
    let(:col) {[[0, 3, 6], [1, 4, 7], [2, 5, 8]]}

    describe '#my_transpose' do 
        context "with valid arguemnts" do 

            it "transpose the array" do 
                expect(row.my_transpose).to eq (col)
            end
        end
        
    end

end


describe '#stock_picker' do 

    let(:stocks) {[93, 91, 100, 95, 90, 99, 95]} 
    # input equals array 
    # first buy low then sell high 

    it 'argument is an array' do
        expect(stocks.is_a?(Array)).to eq true 
    end

    it 'select the most profitable pair of days' do 
        expect(stock_picker(stocks)).to eq [1, 2]
    end

end