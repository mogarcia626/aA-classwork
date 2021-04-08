require "piece"
require "rspec"

describe Piece do 
  subject(:piece) {Piece.new(:white, [0,0], board)} 
  # if we find ourselves reusing a similar variable over and over again, we can create a subject. 
  # subject(:variable_name) 
  
  let(:board) { double("Board", valid_pos?: true)}
  # let(:variable_name) 
  # What if I did want to interact with something else..? I have some methods that rely on a Board class. 
  # This is a unit test though.. We don't care if Board actually works. We can just completely assume that all of its methods works all of the time.
  # So we use let to create a mock of a Board instance


  describe "#initialize" do 

    context "with valid arguments" do 
      # The total number of specs, corresponds to the total number "it" blocks
      it "instantiates a piece correctly" do
        # Creating a piece to test Piece.new
        # piece = Piece.new(:white, [0,0]) => not needed after subject(:piece)

        # two expectations
        expect(piece.color).to be(:white) 
        # to be => checks for object_id
        expect(piece.pos).to eq([0,0])
        # to eq => checks for equality
        # Use to eq for strings since strings tend to have different object_ids 
      end

      it "delegates to the board to insure the passed pos is valid" do 
        # expect does the testing -> when we care that something happened, we use expect
        # allow is similar but doesn't check specifically
        expect(board).to receive(:valid_pos?) 
        Piece.new(:black, [1,1], board)
      end
    end

    # Context helps divide our tests clearly. Generally included when there is a conditional.
    context "with invalid arguments" do 
      it "raises an error when provided an invalid color" do 
        # expect is a method. It immediately executes if it's just a set of parenthesis. 
        # We need a block of code so the error to be raised first before the rspec checks what has to happen. 
        # Run the code first -> see if anything has been raised -> then run the expect
        # If you threw it in parenthesis, the raise error would interrupt our expect, so it wouldn't check properly
        expect { Piece.new(:blue, [0,0], board) }.to raise_error('invalid color')
      end

      it "raises an error when provided an invalid position" do 
        allow(board).to receive(:valid_pos?).and_return(false)
        expect { Piece.new(:white, [-1, -1], board) }.to raise_error('invalid pos')
        expect { Piece.new(:black, [9, 9], board) }.to raise_error('invalid pos')
      end
    end
  end


  describe "#pos=" do 
    before(:each) { piece.pos = [1,1] }
    it "correct reassigns piece\'s position" do 
      # piece = Piece.new(:black, [0,0])
      # piece.pos = [1, 1] #

      expect(piece.pos).to eq([1,1])

    end

    # 10 other it blocks that check pos reassignment
    # user before(:each) to aboid rewriting piece.pos = [1,1] over and over


  end

  describe "#symbol" do 
    it "raises an error" do 
      # piece = Piece.new(:white, [2,2])
      expect{ piece.symbol }.to raise_error(NotImplementedError)
    end
  end

  describe "#empty?" do 
    it "returns false" do 
      # piece = Piece.new(:black, [0,0])

      #checking for specifically false
      expect(piece.empty?).to be false
      # can also use to eq false 

      #checking for falsey values (nil..etc)
      expect(piece.empty?).to be_falsey
    end

  end

  describe "#to_s" do 
    it "returns a formatted string" do 
      # piece = Piece.new(:black, [0,0])

      # :symbol is a "stubbed"/mocked version of a working symbol
      allow(piece).to receive(:symbol).and_return("s") 
      # setting up expectations first and then assuming the symbol method from another class works.
      # This symbol method will not be Piece's symbol method, it would be pawn, knight, etc. 
      # We're assuming the symbol method works from their class and returns a stringified version of that symbol

      expect(piece.to_s).to eq("s")
    end
  end


end