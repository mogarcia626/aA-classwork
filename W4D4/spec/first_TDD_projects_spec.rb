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








describe Piece do 

    describe '#initialize' do 
        it 'should equal value' do 
            piece = Piece.new(1)
            expect(piece.value).to eq (1) 
        end
    end

end

describe Column do 
    subject(:column) { Column.new(3) } 

    describe '#initialize' do 
        it 'should have @stack equal empty array' do 
            expect(column.stack).to eq ([])
        end
        it 'should take the index' do 
            expect(column.index).to eq 3 
        end
    end

    describe '#take_piece' do 


        it 'ensure stack is not empty' do 
            expect(column.take_piece).to raise_error ('this stack is empty')
        end
        it 'should pull from top and return the piece that was taken' do 
            (1..3).each { |i| column.stack << Piece.new(i) }
            expect(column.take_piece.value).to eq (3)
            expect(column.stack[-1].value).to eq (2)
        end


    end

    describe '#drop_piece' do

        it 'raise an error if value of piece in hand is greater than piece in stack' do 
            column.stack << Piece.new(1)
            piece = Piece.new(2)
            expect(column.drop_piece(piece)).to raise_error 'invalid move, piece too large'
        end
        it 'add pieces to the top of stack and returns true when completed' do 
            column.stack << Piece.new(1)
            piece1 = Piece.new(0)
            expect(column.drop_piece(piece1)).to eq true 
            expect(column.stacks[-1].value).to eq (0)
        end


    end


end



        # it 'ensure stack is empty' do 
        #     expect(column.empty?).to raise_error ('this stack is empty')
        # end
        # it 'should pull from top' do 
        #     expect(column.take_piece.index[-1].value).to eq (2)
        # end
        # it 'should return the piece that was taken' do 
        #     expect(column.take_piece).to eq (3)
        # end

