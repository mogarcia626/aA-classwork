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

    def initialize(start_position)        
        @start_position = start_position
        @root_node = PolyTreeNode.new(start_position)        
        @considered_positions = []
    end

    def new_move_positions(parent_node)
        moves = KnightPathFinder.valid_moves(parent_node.value) 
        moves.reject! { |move| @considered_positions.include?(move) }   #remove dup moves
        moves.each { |move| @considered_positions << move }     #adds to 'considered pos' arr
        nodes_arr = moves.map {|move| PolyTreeNode.new(move) }  #create node instances
        nodes_arr.each do |node|    #sets the parent and child node relationship
            node.parent = parent_node
        end
        return nodes_arr #returns arr w/ nodes with parent children relationships set
    end

    def build_move_tree
        remaining_pos = [@start_position]

        while remaining_pos.length > 0
            remaining_pos.each do |pos| # SP
                remaining_pos += next_move_positions(pos)
                remaining_pos.shift
            end
        end
    end
    # search for end_pos in the move tree
    # return the tree node instance containing end_pos
    # returns a node

    # thoughts: call BMT, find path,
    def find_path(end_pos)
        build_move_tree
        nodes_arr = [root_node]
        
        

    end

    # race back from the node to the root using PolyTreeNode#parent
    # returns array of positions
    def trace_path_back 

    end
end

=begin
    def parent=(other_node)
        unless other_node == nil
            @parent.children.reject! { |ele| ele == self } if @parent != nil
            @parent = other_node
                if !other_node.children.include?(self) 
                    other_node.children << self
                end
        else
            @parent = nil
        end 
    end

    def bfs(target_value)
        arr = [self]
        
        while arr.length > 0            
            arr.each do |node|
                return node if node.value == target_value                
                arr += node.children 
                arr.shift                
            end
        end
        nil
    end

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