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

    def new_move_positions(pos)
        moves = KnightPathFinder.valid_moves(pos) # all valid moves based on position
        moves.reject! { |move| @considered_positions.include?(move) }
        moves.each { |move| @considered_positions << move }
        moves # returns potential children/positions
    end

    # run NMP on root node ==> pos that we can turn into new node instances
    # all the new nodes will have P/C relationship. Then we will run NMP on 
    # the children
    def build_move_tree #bfs
        
        remaining_pos = new_move_positions(@start_position)
        # use new_move_positions to create children nodes
        # ths is where we initialize nodes (root node (val = start position)
        

        while remaining_pos.length > 0
            remaining_pos.each do |pos|
                remaining_pos += next_move_positions(pos)
                node = PolyTreeNode.new(remaining_pos.shift)
                
            end
        end

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