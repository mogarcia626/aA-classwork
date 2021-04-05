class KnightPathFinder
    attr_accessor :parent, :children

    def self.valid_moves(pos) #[x,y]
        moves = [ [1,2], [-1,2], [-1,-2], [1,-2], [2,1], [-2,1], [-2,-1], [2,-1] ]
        valid_moves = []
        moves.each do |mov|
            if pos[0] + mov[0] < 8 && pos[1] + mov[1] < 8
                valid_moves << mov
            end
        end
        valid_moves        
    end


    def initialize(position)
        @parent ||= nil
        @position = position
        @root_node = if @parent ? @parent.root_node : @position    
        @children = [] # possible future moves 
        @considered_positions = [@root_node]
    end

    def new_move_positions(pos)
        moves = KnightPathFinder.valid_moves(pos)
        moves.reject! { |move| @considered_positions.include?(move) }
        moves.each { |move| @considered_positions << move }
        moves
    end

    
  

    
end

=begin
    


    def initialize(position)
        @position = position
        @parents ||= []
        @parents += position # parents = Set of current & previous positions
        @children = [] # possible future moves 
    end



    def self.on_board?(pos)
        pos.all? {|i| i < 8}
    end
    
=end