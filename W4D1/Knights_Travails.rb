class KnightPathFinder
    attr_accessor :parent, :children

    
end

=begin
    
def self.valid_moves(position) #[x,y]
        moves = [ [1,2], [-1,2], [-1,-2], [1,-2], [2,1], [-2,1], [-2,-1], [2,-1] ]
        valid_moves = []
        moves.each do |mov|
            if next_move(mov).on_board?
                valid_moves << next_move(mov)
            end
        end
    end

    def initialize(position)
        @position = position
        @parents ||= []
        @parents += position # parents = Set of current & previous positions
        @children = [] # possible future moves 
    end

    private
    def next_move(pos)
        (0..1).map {|i| @root_node[i] + pos[i] }
    end

    def self.on_board?(pos)
        pos.all? {|i| i < 8}
    end
    
=end